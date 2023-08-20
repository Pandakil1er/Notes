## Variables
const,let,var
diff btw var and let

### Hoisting
While variables declared with `var` keyword are [hoisted](https://dev.to/godcrampy/the-secret-of-hoisting-in-javascript-egi) (initialized with `undefined` before the code is run) which means they are accessible in their enclosing scope even before they are declared:
```javascript
function run() {
  console.log(foo); // undefined
  var foo = "Foo";
  console.log(foo); // Foo
}

run();
```


`let` variables are not initialized until their definition is evaluated. Accessing them before the initialization results in a `ReferenceError`. The variable is said to be in "temporal dead zone" from the start of the block until the initialization is processed.

### Scoping

Var is function scoped and let is block scoped

### Creating global object property

At the top level, `let`, unlike `var`, does not create a property on the global object:

```javascript
var foo = "Foo";  // globally scoped
let bar = "Bar"; // not allowed to be globally scoped

console.log(window.foo); // Foo
console.log(window.bar); // undefined
```

### Redeclaration

In strict mode, `var` will let you re-declare the same variable in the same scope while `let` raises a SyntaxError.

```javascript
'use strict';
var foo = "foo1";
var foo = "foo2"; // No problem, 'foo1' is replaced with 'foo2'.

let bar = "bar1"; 
let bar = "bar2"; // SyntaxError: Identifier 'bar' has already been declared
```

Strings are both single quotes and double quotes
\\ escape character
backtick (\`\) for template literal //string jisme variables use kr skte
eg. 
```js
let name = " anshaj"
let str = `hi my name is ${name}`

```

window.prompt

eg. let name = prompt("enter something")

string can be concatenated with +

Number("55.55") to convert string to number
Number("a" ) shows NaN

toString to convert number to string

can include expressions is temperal
```js
let name = `hi 2 + 2 is ${2+2}`

```

template literal respect line break 
```js
console.log(`hi
sdv
vsd`)
```

toFixed()
```js
let x = 55.5645

console.log(x.toFixed(3))

55.565
```

to fixed roundoff to given digits


## String methods
**text.length**
**text.slice(start,end)** // end is not included, indexing from 0,can take negative indexes
**text.substring(start,end)** // cannot take negative indexes
```js
const anyString = "Mozilla";

console.log(anyString.substring(0, 1)); // "M"
console.log(anyString.substring(1, 0)); // "M"

console.log(anyString.substring(0, 6)); // "Mozill"

console.log(anyString.substring(4)); // "lla"
console.log(anyString.substring(4, 7)); // "lla"
console.log(anyString.substring(7, 4)); // "lla"

console.log(anyString.substring(0, 7)); // "Mozilla"
console.log(anyString.substring(0, 10)); // "Mozilla"
```


**text.substr(start,length);**
```js
const aString = "Mozilla";

console.log(aString.substr(0, 1)); // 'M'
console.log(aString.substr(1, 0)); // ''
console.log(aString.substr(-1, 1)); // 'a'
console.log(aString.substr(1, -1)); // ''
console.log(aString.substr(-3)); // 'lla'
console.log(aString.substr(1)); // 'ozilla'
console.log(aString.substr(-20, 2)); // 'Mo'
console.log(aString.substr(20, 2)); // ''
```

**text.replace(pattern,replacement)**
`pattern`

Can be a string or an object with a [`Symbol.replace`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/replace) method — the typical example being a [regular expression](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp). Any value that doesn't have the `Symbol.replace` method will be coerced to a string.
`replacement`

Can be a string or a function.

- If it's a string, it will replace the substring matched by `pattern`. A number of special replacement patterns are supported; see the [Specifying a string as the replacement](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace#specifying_a_string_as_the_replacement) section below.
- If it's a function, it will be invoked for every match and its return value is used as the replacement text. The arguments supplied to this function are described in the [Specifying a function as the replacement](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace#specifying_a_function_as_the_replacement) section below.

A string pattern will only be replaced once. To perform a global search and replace, use a regular expression with the `g` flag, or use [`replaceAll()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replaceAll) instead.

If the `pattern` is an empty string, the replacement is prepended to the start of the string.

JSCopy to Clipboard

```js
"xxx".replace("", "_"); // "_xxx"
```

```js
function replacer(match, p1, p2, p3, offset, string) {
  // p1 is non-digits, p2 digits, and p3 non-alphanumerics
  return [p1, p2, p3].join(" - ");
}
const newString = "abc12345#$*%".replace(/([^\d]*)(\d*)([^\w]*)/, replacer);
console.log(newString); // abc - 12345 - #$*%
```

```js
const str = "Twas the night before Xmas...";
const newstr = str.replace(/xmas/i, "Christmas");
console.log(newstr); // Twas the night before Christmas...
```

```js
const re = /apples/gi;
const str = "Apples are round, and apples are juicy.";
const newstr = str.replace(re, "oranges");
console.log(newstr); // oranges are round, and oranges are juicy.
```

**text replaceall()**
```js
const p = 'The quick brown fox jumps over the lazy dog. If the dog reacted, was it really lazy?';

console.log(p.replaceAll('dog', 'monkey'));
// Expected output: "The quick brown fox jumps over the lazy monkey. If the monkey reacted, was it really lazy?"

// Global flag required when calling replaceAll with regex
const regex = /Dog/gi;
console.log(p.replaceAll(regex, 'ferret'));
// Expected output: "The quick brown fox jumps over the lazy ferret. If the ferret reacted, was it really lazy?"


```

text.toUpperCase();
text.toLowerCase();
hello.concat(" ","world")


text.trim(); // replace whitespaces from all sides
text.trimStart()
text.trimEnd()

text.padStart(4,"x")
text.padEnd
text.charAt()
text.charCodeAt()
text\[0]

text.split(",") //convert string to array



=== null and undefined will be false
but == null and undefined will be true

null == 0 will be false but,
null >= 0 will be true

== use null and undefined as null and undefined but >= convert to 0




?? nullish coalescing return right hand value if left is undefined or null (Empty string is not null)

?.  

The **optional chaining (`?.`)** operator accesses an object's property or calls a function. If the object accessed or function called using this operator is [`undefined`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined) or [`null`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/null), the expression short circuits and evaluates to [`undefined`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined) instead of throwing an error.

```js
const nestedProp = obj.first?.second;
```

```js
function printMagicIndex(arr) {
  console.log(arr?.[42]);
}

printMagicIndex([0, 1, 2, 3, 4, 5]); // undefined
printMagicIndex(); // undefined; if not using ?., this would throw
```

```js
const potentiallyNullObj = null;
let x = 0;
const prop = potentiallyNullObj?.[x++];

console.log(x); // 0 as x was not incremented
```



how to write regex
var reg = \\ab*\\g
var reg = new RegEx()

```js
const re = /ab+c/i; // literal notation
// OR
const re = new RegExp("ab+c", "i"); // constructor with string pattern as first argument
// OR
const re = new RegExp(/ab+c/, "i"); // constructor with regular expression literal as first argument
```





## ARRAY
let money = new Array(10) //10 size ki array
let money = \[10] //1 size ki array

### Array Methods
.toString
.join("\*")
array.push
array.pop
array.shift()
array.unshift()
array.concat
array.flat()
```js
const arr1 = [0, 1, 2, [3, 4]];

console.log(arr1.flat());
// Expected output: Array [0, 1, 2, 3, 4]

const arr2 = [0, 1, 2, [[[3, 4]]]];

console.log(arr2.flat(2));
// Expected output: Array [0, 1, 2, Array [3, 4]]


```

array.splice()
```js
splice(start)
splice(start, deleteCount)
splice(start, deleteCount, item0)
splice(start, deleteCount, item0, item1)
splice(start, deleteCount, item0, item1, /* …, */ itemN)
```

```js
const months = ['Jan', 'March', 'April', 'June'];
months.splice(1, 0, 'Feb');
// Inserts at index 1
console.log(months);
// Expected output: Array ["Jan", "Feb", "March", "April", "June"]

months.splice(4, 1, 'May');
// Replaces 1 element at index 4
console.log(months);
// Expected output: Array ["Jan", "Feb", "March", "April", "May"]


```

array.slice


```js
const animals = ['ant', 'bison', 'camel', 'duck', 'elephant'];

console.log(animals.slice(2));
// Expected output: Array ["camel", "duck", "elephant"]

console.log(animals.slice(2, 4));
// Expected output: Array ["camel", "duck"]

console.log(animals.slice(1, 5));
// Expected output: Array ["bison", "camel", "duck", "elephant"]

console.log(animals.slice(-2));
// Expected output: Array ["duck", "elephant"]

console.log(animals.slice(2, -1));
// Expected output: Array ["camel", "duck"]

console.log(animals.slice());
// Expected output: Array ["ant", "bison", "camel", "duck", "elephant"]


```


array.forEach()
```js
const array1 = ['a', 'b', 'c'];

array1.forEach((element) => console.log(element));

// Expected output: "a"
// Expected output: "b"
// Expected output: "c"


```





for in loop
```js
const object = { a: 1, b: 2, c: 3 };

for (const property in object) {
  console.log(`${property}: ${object[property]}`);
}

// Expected output:
// "a: 1"
// "b: 2"
// "c: 3"
// object can be array and property will be index

```

The **`for...of`** statement executes a loop that operates on a sequence of values sourced from an [iterable object](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol). Iterable objects include instances of built-ins such as [`Array`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array), [`String`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String), [`TypedArray`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray), [`Map`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map), [`Set`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set), [`NodeList`](https://developer.mozilla.org/en-US/docs/Web/API/NodeList) (and other DOM collections), as well as the [`arguments`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/arguments) object, [generators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Generator) produced by [generator functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/function*), and user-defined iterables.

```js
const array1 = ['a', 'b', 'c'];

for (const element of array1) {
  console.log(element);
}

// Expected output: "a"
// Expected output: "b"
// Expected output: "c"


```



## DOM

```js
element.querySelector(selector)  // return first match node
element.querySelectorAll(selector) // return node list
Array.from(Nodelist)
document.createElement(tagname,\[options])

parentNode.appendChild(childnode)
parentNode.insertBefore(childnode,reference node)

parentNode.lastElementChild
parentNode.firstElementChild


div.style.color = blue;

div.setAttribute('id',"thediv")

div.getAttribute("id");

div.removeAttribute("id")

div.classList.add(id)
div.classList.remove(id)
div.classList.toggle(id)





div.textContent = "Hello World"
div.innerHTML = "     "




<script src="" defer>
to load script after loading dom

```
## Events

```html
<button onclick="">

```

```js
btn.onclick=()=>{}



btn.addEventListener("click",function(e))



const buttons = querySelectorAll('button')
buttons.forEach((btn)=>{


})
```