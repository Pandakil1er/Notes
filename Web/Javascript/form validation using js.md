

### [The Constraint Validation API](https://developer.mozilla.org/en-US/docs/Learn/Forms/Form_validation#the_constraint_validation_api)

The Constraint Validation API consists of a set of methods and properties available on the following form element DOM interfaces:

- [`HTMLButtonElement`](https://developer.mozilla.org/en-US/docs/Web/API/HTMLButtonElement) (represents a [`<button>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button) element)
- [`HTMLFieldSetElement`](https://developer.mozilla.org/en-US/docs/Web/API/HTMLFieldSetElement) (represents a [`<fieldset>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/fieldset) element)
- [`HTMLInputElement`](https://developer.mozilla.org/en-US/docs/Web/API/HTMLInputElement) (represents an [`<input>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input) element)
- [`HTMLOutputElement`](https://developer.mozilla.org/en-US/docs/Web/API/HTMLOutputElement) (represents an [`<output>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/output) element)
- [`HTMLSelectElement`](https://developer.mozilla.org/en-US/docs/Web/API/HTMLSelectElement) (represents a [`<select>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/select) element)
- [`HTMLTextAreaElement`](https://developer.mozilla.org/en-US/docs/Web/API/HTMLTextAreaElement) (represents a [`<textarea>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea) element)

The Constraint Validation API makes the following properties available on the above elements.

- `validationMessage`: Returns a localized message describing the validation constraints that the control doesn't satisfy (if any). If the control is not a candidate for constraint validation (`willValidate` is `false`) or the element's value satisfies its constraints (is valid), this will return an empty string.
- `validity`: Returns a `ValidityState` object that contains several properties describing the validity state of the element. You can find full details of all the available properties in the [`ValidityState`](https://developer.mozilla.org/en-US/docs/Web/API/ValidityState) reference page; below is listed a few of the more common ones:
    - [`patternMismatch`](https://developer.mozilla.org/en-US/docs/Web/API/ValidityState/patternMismatch "patternMismatch"): Returns `true` if the value does not match the specified [`pattern`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#pattern), and `false` if it does match. If true, the element matches the [`:invalid`](https://developer.mozilla.org/en-US/docs/Web/CSS/:invalid) CSS pseudo-class.
    - [`tooLong`](https://developer.mozilla.org/en-US/docs/Web/API/ValidityState/tooLong "tooLong"): Returns `true` if the value is longer than the maximum length specified by the [`maxlength`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#maxlength) attribute, or `false` if it is shorter than or equal to the maximum. If true, the element matches the [`:invalid`](https://developer.mozilla.org/en-US/docs/Web/CSS/:invalid) CSS pseudo-class.
    - [`tooShort`](https://developer.mozilla.org/en-US/docs/Web/API/ValidityState/tooShort "tooShort"): Returns `true` if the value is shorter than the minimum length specified by the [`minlength`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#minlength) attribute, or `false` if it is greater than or equal to the minimum. If true, the element matches the [`:invalid`](https://developer.mozilla.org/en-US/docs/Web/CSS/:invalid) CSS pseudo-class.
    - [`rangeOverflow`](https://developer.mozilla.org/en-US/docs/Web/API/ValidityState/rangeOverflow "rangeOverflow"): Returns `true` if the value is greater than the maximum specified by the [`max`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#max) attribute, or `false` if it is less than or equal to the maximum. If true, the element matches the [`:invalid`](https://developer.mozilla.org/en-US/docs/Web/CSS/:invalid) and [`:out-of-range`](https://developer.mozilla.org/en-US/docs/Web/CSS/:out-of-range) CSS pseudo-classes.
    - [`rangeUnderflow`](https://developer.mozilla.org/en-US/docs/Web/API/ValidityState/rangeUnderflow "rangeUnderflow"): Returns `true` if the value is less than the minimum specified by the [`min`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#min) attribute, or `false` if it is greater than or equal to the minimum. If true, the element matches the [`:invalid`](https://developer.mozilla.org/en-US/docs/Web/CSS/:invalid) and [`:out-of-range`](https://developer.mozilla.org/en-US/docs/Web/CSS/:out-of-range) CSS pseudo-classes.
    - [`typeMismatch`](https://developer.mozilla.org/en-US/docs/Web/API/ValidityState/typeMismatch "typeMismatch"): Returns `true` if the value is not in the required syntax (when [`type`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#type) is `email` or `url`), or `false` if the syntax is correct. If `true`, the element matches the [`:invalid`](https://developer.mozilla.org/en-US/docs/Web/CSS/:invalid) CSS pseudo-class.
    - `valid`: Returns `true` if the element meets all its validation constraints, and is therefore considered to be valid, or `false` if it fails any constraint. If true, the element matches the [`:valid`](https://developer.mozilla.org/en-US/docs/Web/CSS/:valid) CSS pseudo-class; the [`:invalid`](https://developer.mozilla.org/en-US/docs/Web/CSS/:invalid) CSS pseudo-class otherwise.
    - `valueMissing`: Returns `true` if the element has a [`required`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#required) attribute, but no value, or `false` otherwise. If true, the element matches the [`:invalid`](https://developer.mozilla.org/en-US/docs/Web/CSS/:invalid) CSS pseudo-class.
- `willValidate`: Returns `true` if the element will be validated when the form is submitted; `false` otherwise.


```js
// There are many ways to pick a DOM node; here we get the form itself and the email
// input box, as well as the span element into which we will place the error message.
const form = document.querySelector("form");
const email = document.getElementById("mail");
const emailError = document.querySelector("#mail + span.error");

email.addEventListener("input", (event) => {
  // Each time the user types something, we check if the
  // form fields are valid.

  if (email.validity.valid) {
    // In case there is an error message visible, if the field
    // is valid, we remove the error message.
    emailError.textContent = ""; // Reset the content of the message
    emailError.className = "error"; // Reset the visual state of the message
  } else {
    // If there is still an error, show the correct error
    showError();
  }
});

form.addEventListener("submit", (event) => {
  // if the email field is valid, we let the form submit
  if (!email.validity.valid) {
    // If it isn't, we display an appropriate error message
    showError();
    // Then we prevent the form from being sent by canceling the event
    event.preventDefault();
  }
});

function showError() {
  if (email.validity.valueMissing) {
    // If the field is empty,
    // display the following error message.
    emailError.textContent = "You need to enter an email address.";
  } else if (email.validity.typeMismatch) {
    // If the field doesn't contain an email address,
    // display the following error message.
    emailError.textContent = "Entered value needs to be an email address.";
  } else if (email.validity.tooShort) {
    // If the data is too short,
    // display the following error message.
    emailError.textContent = `Email should be at least ${email.minLength} characters; you entered ${email.value.length}.`;
  }

  // Set the styling appropriately
  emailError.className = "error active";
}


```


```js
function checkZIP() {
  // For each country, defines the pattern that the ZIP has to follow
  const constraints = {
    ch: [
      "^(CH-)?\\d{4}$",
      "Switzerland ZIPs must have exactly 4 digits: e.g. CH-1950 or 1950",
    ],
    fr: [
      "^(F-)?\\d{5}$",
      "France ZIPs must have exactly 5 digits: e.g. F-75012 or 75012",
    ],
    de: [
      "^(D-)?\\d{5}$",
      "Germany ZIPs must have exactly 5 digits: e.g. D-12345 or 12345",
    ],
    nl: [
      "^(NL-)?\\d{4}\\s*([A-RT-Z][A-Z]|S[BCE-RT-Z])$",
      "Netherland ZIPs must have exactly 4 digits, followed by 2 letters except SA, SD and SS",
    ],
  };

  // Read the country id
  const country = document.getElementById("Country").value;

  // Get the NPA field
  const ZIPField = document.getElementById("ZIP");

  // Build the constraint checker
  const constraint = new RegExp(constraints[country][0], "");
  console.log(constraint);

  // Check it!
  if (constraint.test(ZIPField.value)) {
    // The ZIP follows the constraint, we use the ConstraintAPI to tell it
    ZIPField.setCustomValidity("");
  } else {
    // The ZIP doesn't follow the constraint, we use the ConstraintAPI to
    // give a message about the format required for this country
    ZIPField.setCustomValidity(constraints[country][1]);
  }
}


```