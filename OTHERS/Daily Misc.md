---
title: Daily Misc
created: 2026-06-26 02:55:21
modified: "2026-06-26 03:29:34"
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

### What does `${...}` do?

`${}` is just the full syntax for expanding variables.

These are equivalent:

```
$1
${1}
```

But `${}` becomes necessary when using modifiers like `:-`.

---

### Step 3: What does `:-` mean?

Syntax:

```
${variable:-default}
```

Meaning:

> If `variable` is unset or empty, use `default`.

Example:

```
name="Anshaj"echo "${name:-Unknown}"
```

Output:

```
Anshaj
```


```
git clean -f -d
```
