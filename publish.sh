#!/usr/bin/env bash

set -euo pipefail

VAULT_DIR="${1:-.}"

find "$VAULT_DIR" -type f -name "*.md" | while read -r file; do
  filename="$(basename "$file" .md)"

  # Filesystem modification time
  modified="$(stat -c '%y' "$file")"
  modified="${modified%%.*}"

  # First non-empty line
  first_nonempty=$(grep -m1 -v '^[[:space:]]*$' "$file" || true)

  if [[ "$first_nonempty" == "---" ]]; then
    # Existing frontmatter: update/add modified field only

    tmp=$(mktemp)

    awk -v modified="$modified" '
        BEGIN {
            in_yaml = 0
            modified_found = 0
        }

        NR == 1 && $0 == "---" {
            in_yaml = 1
            print
            next
        }

        in_yaml && $0 == "---" {
            if (!modified_found)
                print "modified: \"" modified "\""

            print
            in_yaml = 0
            next
        }

        in_yaml {
            if ($0 ~ /^modified:[[:space:]]*/) {
                print "modified: \"" modified "\""
                modified_found = 1
            } else {
                print
            }
            next
        }

        { print }
        ' "$file" >"$tmp"

    mv "$tmp" "$file"
    echo "Updated: $file"

  else
    # No frontmatter: create it

    created="$(stat -c '%w' "$file" 2>/dev/null || echo '-')"

    # Fall back to modification time if birth time unavailable
    if [[ "$created" == "-" || "$created" == "1970-01-01"* ]]; then
      created="$(stat -c '%y' "$file")"
    fi

    created="${created%%.*}"

    tmp=$(mktemp)

    cat >"$tmp" <<EOF
---
title: "$filename"
created: "$created"
modified: "$modified"
tags: []
draft: false
---

EOF

    cat "$file" >>"$tmp"
    mv "$tmp" "$file"

    echo "Added frontmatter: $file"
  fi
done

# Only commit if something changed
if ! git diff --quiet || ! git diff --cached --quiet; then
  git add .

  git commit -m "Vault update: $(date '+%Y-%m-%d %H:%M:%S')"

  git push

  echo "Changes pushed to GitHub."
else
  echo "No changes to commit."
fi
