---
title: "Text style"
created: "2024-08-12 00:17:53"
modified: "2024-08-12 00:17:53"
tags: []
draft: false
---

system font stack
```css
body {
  font-family: system-ui, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
}
```

custom downloaded fonts

```css
@font-face {
  font-family: my-cool-font;
  src: url(../fonts/the-font-file.woff);
}

h1 {
  font-family: my-cool-font, sans-serif;
}
```


font-style
letter-spacing
line-height
text-transform - for uppercase lowercase and all
text-shadow : offset
```
/* offset-x | offset-y | blur-radius | color */
text-shadow: 1px 1px 2px black;
```

ellipsis in text overflow
