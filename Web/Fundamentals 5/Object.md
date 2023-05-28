let user = new Object(); // "object constructor" syntax 
let user = {}; // "object literal" syntax

or

let user = {     // an object
  name: "John",  // by key "name" store value "John"
  age: 30        // by key "age" store value 30
};


A property has a key (also known as “name” or “identifier”) before the colon `":"` and a value to the right of it.

alert( user.name ); // John
alert( user.age ); // 30


we can also add values like
user.place = "delhi"

and also delete
delete user.age;

can use multiword properties e.g.
let user = {
  name: "John",
  age: 30,
  "likes birds": true,  // multiword property name must be quoted
};
user[likes bird]

end last property with hanging comma to make it easy to remove add new alement

use square bracker [ ]   to give a value of variable to a key for eg,
let var = "age"
let user = {
\[var]:9
}
sq. bracket can also be used to call values like

user[age]
we cannot use user.var
but can use user[var]


this also called computed properties: 

let fruit = 'apple';
let bag = {
  \[fruit + 'Computers']: 5 // bag.appleComputers = 5
};


**object can also have functions called methods like

```
const person = {
  name: ["Bob", "Smith"],
  age: 32,
  bio: function () {
    console.log(`${this.name[0]} ${this.name[1]} is ${this.age} years old.`);
  },
  introduceSelf: function () {
    console.log(`Hi! I'm ${this.name[0]}.`);
  },
};
```


# Constructors

used to create object like :
```
function createPerson(name) {
  const obj = {};
  obj.name = name;
  obj.introduceSelf = function () {
    console.log(`Hi! I'm ${this.name}.`);
  };
  return obj;
}

```

# property value shorthand


function makeUser(name, age) {
  return {
    name: name,
    age: age,
    // ...other properties
  };
}

let user = makeUser("John", 30);
alert(user.name); // John

**can also be written as**

function makeUser(name, age) {
  return {
    name, // same as name: name
    age,  // same as age: age
    // ...
  };
}

**can mix normal properties and shorthand**
let user = {
  name,  // same as name:name
  age: 30
};


# property name limits

As we already know, a variable cannot have a name equal to one of the language-reserved words like “for”, “let”, “return” etc.

But for an object property, there’s no such restriction:



\__\_proto__

```
let obj = {};
obj.__proto__ = 5; // assign a number
alert(obj.__proto__); // [object Object] - the value is an object, didn't work as intended
```

as this is because proto is used for prototypal inheritence
# in 
let user = { age: 30 };

let key = "age";
alert( key in user );     // true, property "age" exists

why not this :
let user = {};

alert( user.noSuchProperty === undefined ); // true means "no such property"

because this doesnt work for

let obj = {
  test: undefined
};

alert( obj.test ); // it's undefined, so - no such property?

alert( "test" in obj ); // true, the property does exist!

# for in

```
let user = {
  name: "John",
  age: 30,
  isAdmin: true
};

for (let key in user) {
  // keys
  alert( key );  // name, age, isAdmin
  // values for the keys
  alert( user[key] ); // John, 30, true
}
```


# order?
integer properties are ordered e.g.
```let codes = {
  "49": "Germany",
  "41": "Switzerland",
  "44": "Great Britain",
  // ..,
  "1": "USA"
};

for (let code in codes) {
  alert(code); // 1, 41, 44, 49
}

```

but strings are not ordered;
to unorder the integer keys we could use + for eg
"+91" : "ok"

integer property wo hoti jo agar integer m transform kro fir wapas string m toh same rehti 
"49" h
"1.2" ni h
"+49" ni h kyuki usko int m krne se wo 49 hojata + chala jata




# SUMMARY
Objects are associative arrays with several special features.

They store properties (key-value pairs), where:

Property keys must be strings or symbols (usually strings).
Values can be of any type.
To access a property, we can use:

The dot notation: obj.property.
Square brackets notation obj["property"]. Square brackets allow taking the key from a variable, like obj[varWithKey].
Additional operators:

To delete a property: delete obj.prop.
To check if a property with the given key exists: "key" in obj.
To iterate over an object: for (let key in obj) loop.
What we’ve studied in this chapter is called a “plain object”, or just Object.

There are many other kinds of objects in JavaScript:

Array to store ordered data collections,
Date to store the information about the date and time,
Error to store the information about an error.
…And so on.