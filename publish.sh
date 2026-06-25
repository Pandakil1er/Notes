#!/usr/bin/env bash

set -euo pipefail

VAULT_DIR="${1:-.}"

find "$VAULT_DIR" -type f -name "*.md" | while read -r file; do

  filename="$(basename "$file" .md)"

  # Save original modification time (epoch seconds)
  old_mtime=$(stat -c %Y "$file")

  modified=$(date -d "@$old_mtime" "+%Y-%m-%d %H:%M:%S")

  # First non-empty line
  first_nonempty=$(grep -m1 -v '^[[:space:]]*$' "$file" || true)

  tmp=$(mktemp)

  if [[ "$first_nonempty" == "---" ]]; then

    # Update existing frontmatter
    awk -v modified="$modified" -v title="$filename" '
      BEGIN {
        in_yaml = 0
        modified_found = 0
        title_found = 0
      }

      NR == 1 && $0 == "---" {
        in_yaml = 1
        print
        next
      }

      in_yaml && $0 == "---" {
        if (!title_found)
          print "title: \"" title "\""

        if (!modified_found)
          print "modified: \"" modified "\""

        print
        in_yaml = 0
        next
      }

      in_yaml {
        if ($0 ~ /^title:[[:space:]]*/) {
          print "title: \"" title "\""
          title_found = 1
        }
        else if ($0 ~ /^modified:[[:space:]]*/) {
          print "modified: \"" modified "\""
          modified_found = 1
        }
        else {
          print
        }
        next
      }

      {
        print
      }
    ' "$file" >"$tmp"

  else

    # Get creation time if available
    created=$(stat -c '%w' "$file" 2>/dev/null || echo "-")

    if [[ "$created" == "-" || "$created" == "1970-01-01"* ]]; then
      created=$(date -d "@$old_mtime" "+%Y-%m-%d %H:%M:%S")
    else
      created="${created%%.*}"
    fi

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

  fi

  ###########################################################
  # Replace file only if content actually changed
  ###########################################################

  if cmp -s "$file" "$tmp"; then
    rm "$tmp"
  else
    mv "$tmp" "$file"

    # Restore original modification time
    touch -d "@$old_mtime" "$file"

    echo "Updated: $file"
  fi

done

###########################################################
# Git
###########################################################

git add .

if git diff --cached --quiet; then
  echo "No changes to commit."
  exit 0
fi

git commit -m "Vault update: $(date '+%Y-%m-%d %H:%M:%S')"

git push

echo "Changes pushed to GitHub."
