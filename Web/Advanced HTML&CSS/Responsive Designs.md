The smallest phones in common circulation rarely get smaller than `320px`, so that should serve as a reliable lower end target. If your website works as low as `320px` width, then it should work on any small device. The upper limit is a little harder to clarify. These days super-duper-ultra-wide monitors aren’t uncommon, so you should plan for the possibility that your site could be viewed on some ridiculously wide monitor. Often, this is accomplished by setting up a max-width for _all_ of your content and then centering that on the page. With a setup like that your content will look fine even on super-wide resolutions.






For this reason, you should add this snippet into the `<head>` of your HTML file in just about every project you work on.

https://developer.mozilla.org/en-US/docs/Web/HTML/Viewport_meta_tag
```html
<meta name="viewport" content="width=device-width, initial-scale=1">
```

It simply sets the initial width of the webpage to the size of the actual screen you’re viewing it on, and telling it not to zoom in or out. Easy!


# Natural responsiveness??
min-width
min-height for div for not overflowing when viewing on phone

flex-wrap
minmax
auto-fill

common viewports : https://experienceleague.adobe.com/docs/target/using/experiences/vec/mobile-viewports.html

# Images
if background then background-position and background-size:cover,fill,contain

if img tag then object-fit:cover,fill,contain default is fill



## with HTML:
```
<img
  srcset="elva-fairy-480w.jpg 480w, elva-fairy-800w.jpg 800w"
  sizes="(max-width: 600px) 480px,
         800px"
  src="elva-fairy-800w.jpg"
  alt="Elva dressed as a fairy" />
```

```
<img
  srcset="elva-fairy-320w.jpg, elva-fairy-480w.jpg 1.5x, elva-fairy-640w.jpg 2x"
  src="elva-fairy-640w.jpg"
  alt="Elva dressed as a fairy" />
```



```
<picture>
  <source media="(max-width: 799px)" srcset="elva-480w-close-portrait.jpg" />
  <source media="(min-width: 800px)" srcset="elva-800w.jpg" />
  <img src="elva-800w.jpg" alt="Chris standing up holding his daughter Elva" />
</picture>
```
In all cases, you must provide an `<img>` element, with `src` and `alt`, right before `</picture>`, otherwise no images will appear. This provides a default case that will apply when none of the media conditions return true (you could actually remove the second `<source>` element in this example), and a fallback for browsers that don't support the `<picture>` element.

#### [Why can't we just do this using CSS or JavaScript?](https://developer.mozilla.org/en-US/docs/Learn/HTML/Multimedia_and_embedding/Responsive_images#why_cant_we_just_do_this_using_css_or_javascript)

When the browser starts to load a page, it starts to download (preload) any images before the main parser has started to load and interpret the page's CSS and JavaScript. That mechanism is useful in general for reducing page load times, but it is not helpful for responsive images — hence the need to implement solutions like `srcset`. For example, you couldn't load the [`<img>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img) element, then detect the viewport width with JavaScript, and then dynamically change the source image to a smaller one if desired. By then, the original image would already have been loaded, and you would load the small image as well, which is even worse in responsive image terms.


## With CSS
media queries
image-set() function
```
  background-image: image-set(
    url("small-balloons.jpg") 1x,
    url("large-balloons.jpg") 2x);
}


```

# Media queries
```css
@media (max-width: 500px) {

  body {

    background: orange;

  }

}

```

```css
@media screen and (max-width: 480px) {
}
```

This is not necessary, but it _does_ point toward another very useful capability of media queries: changing styles based on the media type. Everything we’ve covered so far has been specifically intended for viewing on some kind of screen so specifying `screen` is redundant. However, it is possible to create a different set of styles for your website when it is sent to your printer or viewed in print-preview mode by using the `print` keyword.

```css
@media print {
  /* print styles go here! */
}
```
This is not something we’re going to focus on in our curriculum, but it may be something you want to consider taking advantage of in some cases. It’s fairly common to change some colors (i.e. make things black/white), and add `display: none` to hide elements that are useless in a printed environment (buttons, nav links, etc).


and , not , only for combining media types and media features or for creating complex media queries


- 320px — 480px: Mobile devices
- 481px — 768px: iPads, Tablets
- 769px — 1024px: Small screens, laptops
- 1025px — 1200px: Desktops, large screens
- 1201px and more —  Extra large screens, TV