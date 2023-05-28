

required validation - required attribute in input

**text length validation**
minlength attribute
maxlength attribute

**Number range validation**
min , max attribute - could also add on dates,time,range,week

**Pattern validation**
pattern attribute
```html
<form action="#" method="get">
  <div>
    <label for="zip_code">Postal / Zip Code:</label>
  </div>

  <input type="text" id="zip_code" name="zip_code" pattern="(\d{5}([\-]\d{4})?)" title="Please enter a valid zip code, example: 65251" placeholder="65251" required>
  
  <div>
```
add title attribute for error message when input doesnt match pattern

can target form control that are valid or not valid by :valid :invalid pseudo class
