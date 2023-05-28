Getters & Setters

```js
let user = { get fullName() { return `...`; } }; _user.fullName = "Test"; // Error (property has only a getter)_

```

```js
let user = { name: "John", surname: "Smith", get fullName() { return `${this.name} ${this.surname}`; }, _set fullName(value) { [this.name, this.surname] = value.split(" "); }_ }; // set fullName is executed with the given value. user.fullName = "Alice Cooper"; alert(user.name); // Alice alert(user.surname); // Cooper

```

For accessor properties, there is no `value` or `writable`, but instead there are `get` and `set` functions.

That is, an accessor descriptor may have:

- **`get`** – a function without arguments, that works when a property is read,
- **`set`** – a function with one argument, that is called when the property is set,
- **`enumerable`** – same as for data properties,
- **`configurable`** – same as for data properties.

Please note that a property can be either an accessor (has `get/set` methods) or a data property (has a `value`), not both.

If we try to supply both `get` and `value` in the same descriptor, there will be an error:

```javascript
let user = {
  name: "John",
  surname: "Smith"
};

Object.defineProperty(user, 'fullName', {
  get() {
    return `${this.name} ${this.surname}`;
  },

  set(value) {
    [this.name, this.surname] = value.split(" ");
  }
});

alert(user.fullName); // John Smith

for(let key in user) alert(key); // name, surname
```

```js
_// Error: Invalid property descriptor._ 
Object.defineProperty({}, 'prop', { get() { 
	return 1 
	},
	 value: 2 
});

```

```js
class User { constructor(name) { this.name = name; } sayHi() { alert(this.name); } } // Usage: let user = new User("John"); user.sayHi();

```

```
class Point {
  constructor(x, y) {
    this.x = x;
    this.y = y;
  }

  static displayName = "Point";
  static distance(a, b) {
    const dx = a.x - b.x;
    const dy = a.y - b.y;

    return Math.hypot(dx, dy);
  }
}

const p1 = new Point(5, 5);
const p2 = new Point(10, 10);
p1.displayName; // undefined
p1.distance; // undefined
p2.displayName; // undefined
p2.distance; // undefined

console.log(Point.displayName); // "Point"
console.log(Point.distance(p1, p2)); // 7.0710678118654755
```



yield & yield* 
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/function*


```

//generator function
function* countAppleSales() {
  const saleList = [3, 7, 5];
  for (let i = 0; i < saleList.length; i++) {
    yield saleList[i];
  }
}
```

```
const appleStore = countAppleSales(); // Generator { }
console.log(appleStore.next()); // { value: 3, done: false }
console.log(appleStore.next()); // { value: 7, done: false }
console.log(appleStore.next()); // { value: 5, done: false }
console.log(appleStore.next()); // { value: undefined, done: true }
```


### [Example with yield*](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/function*#example_with_yield)

```
function* anotherGenerator(i) {
  yield i + 1;
  yield i + 2;
  yield i + 3;
}

function* generator(i) {
  yield i;
  yield* anotherGenerator(i);
  yield i + 10;
}

const gen = generator(10);

console.log(gen.next().value); // 10
console.log(gen.next().value); // 11
console.log(gen.next().value); // 12
console.log(gen.next().value); // 13
console.log(gen.next().value); // 20
```





```
class Rectangle {
  constructor(height, width) {
    this.height = height;
    this.width = width;
  }
  // Getter
  get area() {
    return this.calcArea();
  }
  // Method
  calcArea() {
    return this.height * this.width;
  }
  *getSides() {
    yield this.height;
    yield this.width;
    yield this.height;
    yield this.width;
  }
}

const square = new Rectangle(10, 10);

console.log(square.area); // 100
console.log([...square.getSides()]); // [10, 10, 10, 10]
```


#### Private class features

Using private fields, the definition can be refined as below.

```
class Rectangle {
  #height = 0;
  #width;
  constructor(height, width) {
    this.#height = height;
    this.#width = width;
  }
}
```


**Extend keyword**

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes/extends


```
function OldStyleClass() {
  this.someProperty = 1;
}
OldStyleClass.prototype.someMethod = function () {};

class ChildClass extends OldStyleClass {}

class ModernClass {
  someProperty = 1;
  someMethod() {}
}

class AnotherChildClass extends ModernClass {}
```

symbol species
The `Symbol.species` property is defined as a static getter method within the class. The getter method returns the `Array` constructor. By returning `Array`, you are specifying that when methods such as `map()`, `slice()`, or `filter()` are called on an instance of the class, they should return new instances of `Array`, rather than instances of the subclass (`MyArray` in this case).

//chatgpt
The syntax you're referring to, `static get [Symbol.species]() { ... }`, is a way to define a static getter method for the `Symbol.species` property using computed property names in JavaScript.

In JavaScript, square brackets `[]` are used to define computed property names. When using computed property names, the expression within the brackets is evaluated, and the result is used as the property name.

In the case of `static get [Symbol.species]() { ... }`, `Symbol.species` is a symbol representing the `species` property. By using the square brackets, it allows us to define a getter method for the `Symbol.species` property within the class.

Here's a breakdown of the syntax:

- `static`: The `static` keyword is used to define a static method or property that belongs to the class itself, rather than individual instances.
- `get`: The `get` keyword is used to define a getter method for the property.
- `[Symbol.species]`: The computed property name syntax is used with `Symbol.species` inside the square brackets to define the property name as the `Symbol.species`.
- `()`: An empty parameter list is used for the getter method since it doesn't require any arguments.
- `{ ... }`: The curly braces contain the body of the getter method, where you can define the logic for what should be returned when accessing `Symbol.species`.

In the given code snippet, the `static get [Symbol.species]() { ... }` syntax is used to define a static getter method specifically for the `Symbol.species` property within the `MyArray` class.//

**Mixins**

```
const calculatorMixin = (Base) =>
  class extends Base {
    calc() {}
  };

const randomizerMixin = (Base) =>
  class extends Base {
    randomize() {}
  };
```

Copy to ClipboardCopy to ClipboardCopy to Clipboard

A class that uses these mix-ins can then be written like this:

```
class Foo {}
class Bar extends calculatorMixin(randomizerMixin(Foo)) {}
```

**Composition**

```
class ReadOnlyMap {
  #data;
  constructor(values) {
    this.#data = new Map(values);
  }
  get(key) {
    return this.#data.get(key);
  }
  has(key) {
    return this.#data.has(key);
  }
  get size() {
    return this.#data.size;
  }
  *keys() {
    yield* this.#data.keys();
  }
  *values() {
    yield* this.#data.values();
  }
  *entries() {
    yield* this.#data.entries();
  }
  *[Symbol.iterator]() {
    yield* this.#data[Symbol.iterator]();
  }
}
```

```js
// Smaller independent objects or functions

// A car object
const car = {
  start() {
    console.log("Car started.");
  },
  stop() {
    console.log("Car stopped.");
  }
};

// A radio object
const radio = {
  playMusic() {
    console.log("Playing music on the radio.");
  }
};

// Combining the smaller objects to create a more complex object

// A car with a radio
const carWithRadio = Object.assign({}, car, radio);

// Using the composed object
carWithRadio.start();     // Car started.
carWithRadio.playMusic(); // Playing music on the radio.
carWithRadio.stop();      // Car stopped.


```
