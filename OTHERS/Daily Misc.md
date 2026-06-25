---
title: "Daily Misc"
created: "2026-06-26 02:55:21"
modified: "2026-06-26 02:57:21"
tags: []
draft: false
---


# 26 June
```
set -euo pipefail
```

Enables strict mode:

- `-e`: exit immediately if any command fails.
- `-u`: error if an undefined variable is used.
- `pipefail`: if any command in a pipeline fails, the whole pipeline fails.

Without this, scripts can silently continue after errors.

```
VAULT_DIR="${1:-.}"

:- = means if the first argurement is empty then take this
```

Gets the first command-line argument.

Example:

```
./obsidian-frontmatter.sh ~/vault
```

Then:

```
VAULT_DIR="~/vault"
```

If no argument is provided:

```
./obsidian-frontmatter.sh
```

Then:

```
VAULT_DIR="."
```

