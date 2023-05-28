

https://www.theodinproject.com/lessons/node-path-javascript-objects-and-object-constructors


```javascript
Object.getPrototypeOf(player1) === Player.prototype // returns true
Object.getPrototypeOf(player2) === Player.prototype 
```


not recommmended ```
book.__proto__```


Object.setPrototypeOf()
```javascript
function Person(name) {
  this.name = name
}

Person.prototype.sayName = function() {
  console.log(`Hello, I'm ${this.name}!`)
}

function Player(name, marker) {
  this.name = name
  this.marker = marker
}

Player.prototype.getMarker = function() {
  console.log(`My marker is '${this.marker}'`)
}

// Object.getPrototypeOf(Player.prototype) should 
// return the value of "Person.prototype" instead 
// of "Object.prototype"
Object.getPrototypeOf(Player.prototype) // returns Object.prototype

// Now make `Player` objects inherit from `Person`
Object.setPrototypeOf(Player.prototype, Person.prototype)
Object.getPrototypeOf(Player.prototype) // returns Person.prototype

const player1 = new Player('steve', 'X')
const player2 = new Player('also steve', 'O')

player1.sayName() // Hello, I'm steve!
player2.sayName() // Hello, I'm also steve!

player1.getMarker() // My marker is 'X'
player2.getMarker() // My marker is 'O'
```

call() function

```
globalThis.globProp = "Wisen";

function display() {
  console.log(`globProp value is ${this.globProp}`);
}

display.call(); // Logs "globProp value is Wisen"
```

.apply()

dont do this :

```javascript
function Person(name) {
  this.name = name
}

Person.prototype.sayName = function() {
  console.log(`Hello, I'm ${this.name}!`)
}

function Player(name, marker) {
  this.name = name
  this.marker = marker
}

// Don't do this!
// Use Object.setPrototypeOf(Player.prototype, Person.prototype)
Player.prototype = Person.prototype

function Enemy(name) {
  this.name = name
  this.marker = '^'
}

// Not again!
// Use Object.setPrototypeOf(Enemy.prototype, Person.prototype)
Enemy.prototype = Person.prototype

Enemy.prototype.sayName = function() { 
  console.log('HAHAHAHAHAHA')
}

const carl = new Player('carl', 'X')
carl.sayName() // Uh oh! this logs "HAHAHAHAHAHA" because we edited the sayName function!
```

```
Array.prototype.isPrototypeOf(y);      // true
Object.prototype.isPrototypeOf(Array); // true
```
We can use the `instanceof` operator to test whether the `prototype` property of a constructor appears anywhere within an object’s prototype chain.

```
y instanceof Array; // true
```

.bind

this https://dmitripavlutin.com/gentle-explanation-of-this-in-javascript/



```
function(name,life){

return{name,life}
}

```


# Factory Function

```javascript
const personFactory = (name, age) => {
  const sayHello = () => console.log('hello!');
  return { name, age, sayHello };
};

const jeff = personFactory('jeff', 27);

console.log(jeff.name); // 'jeff'

jeff.sayHello(); // calls the function and logs 'hello!'
```


**closure**
```javascript
const FactoryFunction = string => {
  const capitalizeString = () => string.toUpperCase();
  const printString = () => console.log(`----${capitalizeString()}----`);
  return { printString };
};

const taco = FactoryFunction('taco');

printString(); // ERROR!!
capitalizeString(); // ERROR!!
taco.capitalizeString(); // ERROR!!
taco.printString(); // this prints "----TACO----"
```

```javascript
const Player = (name, level) => {
  let health = level * 2;
  const getLevel = () => level;
  const getName  = () => name;
  const die = () => {
    // uh oh
  };
  const damage = x => {
    health -= x;
    if (health <= 0) {
      die();
    }
  };
  const attack = enemy => {
    if (level < enemy.getLevel()) {
      damage(1);
      console.log(`${enemy.getName()} has damaged ${name}`);
    }
    if (level >= enemy.getLevel()) {
      enemy.damage(1);
      console.log(`${name} has damaged ${enemy.getName()}`);
    }
  };
  return {attack, damage, getLevel, getName};
};

const jimmie = Player('jim', 10);
const badGuy = Player('jeff', 5);
jimmie.attack(badGuy);
```

destructuring assignment
```javascript
const Person = (name) => {
  const sayName = () => console.log(`my name is ${name}`);
  return {sayName};
}

const Nerd = (name) => {
  // simply create a person and pull out the sayName function with destructuring assignment syntax!
  const {sayName} = Person(name);
  const doSomethingNerdy = () => console.log('nerd stuff');
  return {sayName, doSomethingNerdy};
}

const jeff = Nerd('jeff');

jeff.sayName(); // my name is jeff
jeff.doSomethingNerdy(); // nerd stuff
```

object.assign  
```
Object.assign(target, ...sources)
```
```javascript
const Nerd = (name) => {
  const prototype = Person(name);
  const doSomethingNerdy = () => console.log('nerd stuff');
  return Object.assign({}, prototype, {doSomethingNerdy});
}
```

# Modules
```javascript
var myModule = (function() {  'use strict';  var _privateProperty = 'Hello World';  var publicProperty = 'I am a public property';  function _privateMethod() {    console.log(_privateProperty);  }  function publicMethod() {    _privateMethod();  }  return {    publicMethod: publicMethod,    publicProperty: publicProperty  };})();myModule.publicMethod(); // outputs 'Hello World'console.log(myModule.publicProperty); // outputs 'I am a public property'console.log(myModule._privateProperty); // is undefined protected by the module closuremyModule._privateMethod(); // is TypeError protected by the module closure
```
