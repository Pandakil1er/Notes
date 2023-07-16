**css**
resize


backdrop-filter

animation 
```css
body
  padding: 50px
  
.trigger
  width: 200px
  height: 200px
  border: 20px solid #999
  background: #ddd
  
.box
  display: inline-block
  background: pink
  width: 200px
  height: 200px
  transition: transform 300ms cubic-bezier(0, 0.47, 0.32, 1.97)
  pointer-events: none
.trigger.clicked .box
  transform: translate(200px, 150px) rotate(20deg)

```





**js**
...spread operator to turn nodelist to array.

```js
var nav = document.querySelector('.nav'); // <nav class="nav"> var toggleNav = function () { var that = this; console.log(that); // <nav> element setTimeout(function () { console.log(that); // <nav> element }, 1000); }; nav.addEventListener('click', toggleNav, false);

```

query selector can select from any element not only from document

**others**
scss,less ----- preprocessors
tailwind,bootstrap ---- frameworks