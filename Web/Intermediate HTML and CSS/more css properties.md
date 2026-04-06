**Background**
1. attachment
```
p {
  background-image: url("starsolid.gif"), url("startransparent.gif");
  background-attachment: fixed, scroll;
  background-repeat: no-repeat, repeat-y;
}
```
scroll,fixed,local

2. clip - border-box,padding,content,text
3. color - beneath border
4. image - can be more than one,linear gradient,radial gradient
5. origin -set the background origin {border-box,padding-box,content-box}
6. position ```
background-position: top;
background-position: bottom;
background-position: left;
background-position: right;
background-position: center;

/* <percentage> values */
background-position: 25% 75%;

/* <length> values */
background-position: 0 0;
background-position: 1cm 2cm;
background-position: 10ch 8em;

/* Multiple images */
background-position: 0 0, center;

/* Edge offsets values */
background-position: bottom 10px right 20px;
background-position: right 3em bottom 10px;
background-position: bottom 10px right;
background-position: top right 10px;

% is relative to container```
7. repeat - {x,y,repeat,round,space,no-repeat}
8. size - {contain,cover,30%,40px,auto}

**Border**
shorthand border-color border-style border-width

similar to outline but
The `outline` property in CSS draws a line around the outside of an element. It’s similar to [border](https://css-tricks.com/almanac/properties/b/border/) except that:

1.  It always goes around all the sides, you can’t specify particular sides
2.  It’s not a part of the [box model](https://css-tricks.com/the-css-box-model/), so it won’t affect the position of the element or adjacent elements (nice for debugging!)

border radius - left,right,right,left

**box-shadow**
```
box-shadow: [horizontal offset] [vertical offset] [blur radius] [optional spread radius] [color];

```
could be more than one;

	inset keyword for shadow inside box

**overflow**
shorthand for overflow x,overflowy
```
/* Keyword values */
overflow: visible;
overflow: hidden;
overflow: clip;
overflow: scroll;
overflow: auto;
overflow: hidden visible;
```

custom scrollbars- http://manos.malihu.gr/repository/custom-scrollbar/demo/examples/complete_examples.html

**opacity**
pro-tip - change on hover