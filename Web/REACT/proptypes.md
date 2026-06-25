---
title: "proptypes"
created: "2024-08-12 00:17:53"
modified: "2026-06-26 03:21:09"
tags: []
draft: false
---



```javascript
import React from 'react';
import PropTypes from 'prop-types';

const RenderName = (props) => {
  return <div>{props.name}</div>;
};

RenderName.propTypes = {
  name: PropTypes.string,
};

RenderName.defaultProps = {
  name: 'Zach',
};

export default RenderName;
```

https://legacy.reactjs.org/docs/typechecking-with-proptypes.html
