
https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Animations/Using_CSS_animations



```css
#ball {
  /* ... other CSS properties ... */
  animation-duration: 2s;
  animation-name: change-color;
  animation-iteration-count: infinite;
  animation-direction: alternate;
}
@keyframes change-color {
  from {
    background-color: red;
  }

  to {
    background-color: green;
  }
}

```


The sub-properties of the [`animation`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation) property are:

[`animation-composition`](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-composition)

Specifies the [composite operation](https://developer.mozilla.org/en-US/docs/Glossary/Composite_operation) to use when multiple animations affect the same property simultaneously. This property is not part of the `animation` shorthand property.



shorthand : 
https://developer.mozilla.org/en-US/docs/Web/CSS/animation





```
animation-name: fadeInOut, moveLeft300px, bounce;
animation-duration: 2.5s, 5s, 1s;
animation-iteration-count: 2, 1, 5;
```