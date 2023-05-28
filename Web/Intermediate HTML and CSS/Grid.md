https://css-tricks.com/snippets/css/complete-guide-grid/#grid-properties

flex : grow,shrink,basis


basic syntax
```.container {
  display: grid;
  grid-template-columns: 60px 50px;
  grid-template-rows: 80px 80px;
  column-gap:10px;
  row-gap:50px;
}
//same as 
gap : 50px 10px;
```

shorthand for template 
```css
grid-template: 50px 50px / 50px 50px 50px;
```

pehle rows fir column     rows / columns

implicit grid tracks
```css
.container {
  display: grid;
  grid-template-columns: 50px 50px;
  grid-template-rows: 50px 50px;
  grid-auto-rows: 50px;
}
```
By default, CSS Grid will add additional content with implicit rows. This means the extra elements would keep being added further down the grid in a vertical fashion. It would be much less common to want extra content added horizontally along the grid, _but_ that can be set using the `grid-auto-flow: column` property and those implicit track sizes can be defined with the `grid-auto-columns` property.


grid lines
grid tracks
grid area
grrid cell


`grid-row-start` / `grid-column-start` / `grid-row-end` / `grid-column-end` into one line using `grid-area`.

```css
#living-room {
  grid-area: 1 / 1 / 3 / 6;
}
```



grid-template-areas

```css
.container {
  display: inline-grid;
  grid-template: 40px 40px 40px 40px 40px / 40px 40px 40px 40px 40px;
  background-color: lightblue; 
  grid-template-areas:
    "living-room living-room living-room living-room living-room"
    "living-room living-room living-room living-room living-room"
    "bedroom bedroom bathroom kitchen kitchen"
    "bedroom bedroom bathroom kitchen kitchen"
    "closet closet . . ."    
}

.room {
  border: 1px solid;
  font-size: 50%;
  text-align: center;
}

#living-room {
   grid-area:  living-room;
}

#kitchen {
  grid-area: kitchen;
}

#bedroom {
  grid-area: bedroom;
}

#bathroom {
  grid-area: bathroom;
}

#closet {
  grid-area: closet;
}


```


span in grid-column and grid row



repeat()
minmax()
`minmax()` is a CSS function that is specifically used with Grid. It can only be used with the following CSS properties:

-   `grid-template-columns`
-   `grid-template-rows`
-   `grid-auto-columns`
-   `grid-auto-rows`

clamp()
clamp(minimum-size, ideal-size, maximum-size)

kahi bhi use kr skte clamp()


auto-fit & auto-fill


interesting
- So what’s going on here specifically with `repeat(auto-fit, minmax(150px, 1fr));`? Simple! Remember that `auto-fit` will return the **highest positive integer** without overflowing the grid. So first, the browser has to know how wide our grid is: in this case, it’s just the window’s width (minus margins) because we didn’t explicitly set it. For the sake of this example, let’s pretend like our window is currently `500px` wide. Second, the browser needs to know how many grid column tracks could possibly fit in that width. To do this, it uses the minimum value in our `minmax()` function, since that will yield the highest number of items, which is `150px`. If our window is `500px` wide, this means our grid will render 3 columns. But wait, there’s more! Once the browser has determined how many columns we can fit, it then resizes our columns up to the maximum value allowed by our `minmax()` function. In this case, our max size is `1fr`, so all three columns will be given an equal allotment of the space available. As we resize our window, these calculations happen in realtime and the result is what you see in the above example!


diff b/w auto-fit auto-fill
https://www.theodinproject.com/lessons/node-path-intermediate-html-and-css-advanced-grid-properties