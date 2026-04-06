action and method
action to know where to send data
method to know which http request method use to submitt the form
```html
<form action="example.com/path" method="post">

</form>
```

**http request methods** - https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods


# Form controls
**input**
 ```HTML
<form action="example.com/path" method="post">
  <input type="text">
</form>
```

**label** 
```html
<form action="example.com/path" method="post">
  <label for="first_name">First Name:</label>
  <input type="text" id="first_name">
</form>
```

**placeholder attribute in input tag**
```html
<label for="first_name">First Name:</label>
<input type="text" id="first_name" placeholder="Bob...">
```

**name attribute** for the backend to know what each piece of data represents
```html
<label for="first_name">First Name:</label>
<input type="text" id="first_name" name="first_name">
```
form input should always have name attribute otherwise it will be ignored when form is submitted

**type attribute**
```html
<label for="user_email">Email Address:</label>
<input type="email" id="user_email" name="email" placeholder="you@example.com">
```
Types -
- email
- password
- number
- date
- file
- color
- image
- range
- search
- tel
- url

**textarea tag**
```html
<textarea name="story "rows="20" cols="60" wrap=soft>some initial content</textarea>
```
wrap can be soft,hard,off

**Select dropdown**
```html
<select name="Car">
  <option value="mercedes">Mercedes</option>
  <option value="tesla">Tesla</option>
  <option value="volvo" selected>Volvo</option>
  <option value="bmw">BMW</option>
  <option value="mini">Mini</option>
  <option value="ford">Ford</option>
</select>
```

All the option elements should(otherwise the text content inside is used) have a value attribute. This value will be sent to the server when the form is submitted.

We may also split the list of options into groups using the `<optgroup>` element. The optgroup element takes a `label` attribute which the browser uses as the label for each group:
```html
<select name="fashion" multiple size="2">
  <optgroup label="Clothing">
    <option value="t_shirt">T-Shirts</option>
    <option value="sweater">Sweaters</option>
    <option value="coats">Coats</option>
  </optgroup>
  <optgroup label="Foot Wear">
    <option value="sneakers">Sneakers</option>
    <option value="boots">Boots</option>
    <option value="sandals">Sandals</option>
  </optgroup>
</select>
```

**Radio buttons** 
if two radio button have same name attribute than only one can be selected other will be automatically deselected;
can add default by adding checked attribute
```html
<h1>Ticket Type</h1>
<div>
  <input type="radio" id="child" name="ticket_type" value="child">
  <label for="child">Child</label>
</div>

<div>
  <input type="radio" id="adult" name="ticket_type" value="adult" checked>
  <label for="adult">Adult</label>
</div>

<div>
  <input type="radio" id="senior" name="ticket_type" value="senior">
  <label for="senior">Senior</label>
</div>
```
radio are inline element use div to seperate line

**Checkboxes**
radio but you could select more than one;
checked to default check;
```html
<h1>Pizza Toppings</h1>

<div>
  <input type="checkbox" id="sausage" name="topping" value="sausage">
  <label for="sausage">Sausage</label>
</div>

<div>
  <input type="checkbox" id="onions" name="topping" value="onions">
  <label for="onions">Onions</label>
</div>

<div>
  <input type="checkbox" id="pepperoni" name="topping" value="pepperoni">
  <label for="pepperoni">Pepperoni</label>
</div>

<div>
  <input type="checkbox" id="mushrooms" name="topping" value="mushrooms">
  <label for="mushrooms">Mushrooms</label>
</div>
```

**meter tag**

```
<meter min="0" max="100" value="75" low="33" high="66" optimum="50">75</meter>
```


**progress tag**
```
<progress max="100" value="75">75/100</progress>
```

**Button tag**
```html
<button>Click Me</button>
```

submit button
```html
<button type="submit">Submit</button>
```
type is submit default

reset button
```html
<button type="reset">Reset</button>
```

generic button
```html
<button type="button">Click to Toggle</button>
```

**Note**: It is important to remember that a button within a form with the `type` value of submit (which happens to be the default value) will always try to make a new request and submit data back to the server. Hence, for buttons that are used within a form for different purposes other than submitting the data, the `type` attribute should always be specified to avoid unwanted effects of submitting a form.

other inputs - https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input

inputs can have a form attribute to specify form id;



**fieldset tag**
**legend tag**

# customising forms ?

visit this - https://developer.mozilla.org/en-US/docs/Learn/Forms/Styling_web_forms


Text-based form controls like text, email, password and text areas are reasonably straightforward to style. They operate like any other HTML element, and most CSS properties can be used on them.

Things get more tricky when creating custom styles for radio buttons and checkboxes. But there are many [guides](https://moderncss.dev/pure-css-custom-checkbox-style) out there you can use to achieve your desired design. There have also been [new CSS properties](https://developer.mozilla.org/en-US/docs/Web/CSS/accent-color) made available in recent times to make styling radio buttons and checkboxes much easier.

Certain aspects of other elements are downright impossible to style, for example, calendar or date pickers. If we want custom styles for these, we will have to build custom form controls with JavaScript or use one of the many JavaScript libraries that provide us with ready-made solutions.
**accent-color property**
Browsers that support `accent-color` currently apply it to the following HTML elements:

-   [`<input type="checkbox">`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/checkbox)
-   [`<input type="radio">`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/radio)
-   [`<input type="range">`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/range)
-   [`<progress>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/progress)