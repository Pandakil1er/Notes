div p - all p that have a ancestor of div;
-   `>` - the child combinator
-   `+` - the adjacent sibling combinator
-   `~` - the general sibling combinator

diff b/w pseudo class : and element ::

formula for css specifity
style attribut , id , class:pseudoclass:attribute,elements;


**pseudo class**
foucs
active
hover
link
visited

[`:root`](https://css-tricks.com/almanac/selectors/r/root/) is a special class that represents the very top level of your document - the one element that has no parents. Generally when working with the web, this is equivalent to the `html` element, but there are a [few subtle differences](https://stackoverflow.com/questions/15899615/whats-the-difference-between-css3s-root-pseudo-class-and-html).

`:root` is generally the place where you will place your ‘global’ CSS rules that you want available everywhere - such as your custom properties and CSS variables, or rules such as `box-sizing: border-box;`.

[`:first-child`](https://css-tricks.com/almanac/selectors/f/first-child/) and [`:last-child`](https://css-tricks.com/almanac/selectors/l/last-child/) will match elements that are the first or last sibling.

Similarly, [`:empty`](https://css-tricks.com/almanac/selectors/e/empty/) will match elements that have no children at all, and [`:only-child`](https://css-tricks.com/almanac/selectors/o/only-child/) will match elements that don’t have any siblings.

For a more dynamic approach we can use [`:nth-child`](https://css-tricks.com/almanac/selectors/n/nth-child/). This is a flexible pseudo-class with a few different uses.
```css
 .myList:nth-child(5) {/* Selects the 5th element with class myList */}

  .myList:nth-child(3n) { /* Selects every 3rd element with class myList */}

  .myList:nth-child(3n + 3) { /* Selects every 3rd element with class myList, beginning with the 3rd */}

  .myList:nth-child(even) {/* Selects every even element with class myList */}
```

**psuedo elements**
[`::marker`](https://css-tricks.com/almanac/selectors/m/marker/) allows you to customize the styling of your `<li>` elements’ bullets or numbers.

[`::first-letter`](https://css-tricks.com/almanac/selectors/f/first-letter/) and [`::first-line`](https://css-tricks.com/almanac/selectors/f/first-line/) allow you to (you guessed it!) give special styling to the first letter or line of some text.

[`::selection`](https://css-tricks.com/almanac/selectors/s/selection/) allows you to change the highlighting when a user selects text on the page.

[`::before` and `::after`](https://css-tricks.com/almanac/selectors/a/after-and-before/) allow us to add extra elements onto the page with CSS, instead of HTML. Using it to decorate text in various ways is one common use case.

**Attribute selector**
```css
  [src] {
    /* This will target any element that has a src attribute. */
  }

  img[src] {
    /* This will only target img elements that have a src attribute. */
  }

  img[src="puppy.jpg"] {
    /* This will target img elements with a src attribute that is exactly "puppy.jpg" */
  }
```

```css
[class^='aus'] {
  /* Classes are attributes too!
    This will target any class that begins with 'aus':
    class='austria'
    class='australia'
  */
}

[src$='.jpg'] {
  /* This will target any src attribute that ends in '.jpg':
  src='puppy.jpg'
  src='kitten.jpg'
  */
}

[for*='ill'] {
  /* This will target any for attribute that has 'ill' anywhere inside it:
  for="bill"
  for="jill"
  for="silly"
  for="ill"
  */
}
```

`[attr operator value i]`

Adding an `i` (or `I`) before the closing bracket causes the value to be compared case-insensitively (for characters within the ASCII range).

`[attr operator value s]` Experimental

Adding an `s` (or `S`) before the closing bracket causes the value to be compared case-sensitively (for characters within the ASCII range).