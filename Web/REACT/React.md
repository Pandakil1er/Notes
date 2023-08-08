

# Basic
```sh
npm create vite@latest my-first-react-app -- --template react
```

```jsx
function Greeting() {
  return <h1>"I swear by my pretty floral bonnet, I will end you."</h1>;
}

export default Greeting;
```



## JSX

create element funtion in react (for creating a element without jsx)
https://react.dev/reference/react/createElement
```jsx
const element = createElement(type, props, ...children)

```


1. camelCase **Most** things.
    
    JSX turns into JavaScript, and attributes of elements become keys of JavaScript objects, so you can’t use dashes or reserved words such as `class`. Because of this, many HTML attributes are written in camelCase. Instead of `stroke-width`, you’d use `strokeWidth`, and instead of `class` you’d use `className`.
    
    Correct:
    
    ```jsx
    function App() {
      return (
        <>
          <div className="container">
            <svg>
              <circle cx="25" cy="75" r="20" stroke="green" strokeWidth="2" />
            </svg>
          </div>
        </>
      );
    }
    ```
    
    Incorrect:
    
    ```jsx
    function App() {
      return (
        <>
          <div class="container">
            <svg>
              <circle cx="25" cy="75" r="20" stroke="green" stroke-width="2" />
            </svg>
          </div>
        </>
      );
    }
    ```


When you want to pass a string attribute to JSX, you put it in single or double quotes:

But what if you want to dynamically specify the `src` or `alt` text? You could **use a value from JavaScript by replacing `"` and `"` with `{` and `}`**:

```export default function Avatar() {
  const avatar = 'https://i.imgur.com/7vQD0fPs.jpg';
  const description = 'Gregorio Y. Zara';
  return (
    <img
      className="avatar"
      src={avatar}
      alt={description}
    />
  );
}


```


Any JavaScript expression will work between curly braces, including function calls like `formatDate()`:

```jsx
const today = new Date();

function formatDate(date) {
  return new Intl.DateTimeFormat(
    'en-US',
    { weekday: 'long' }
  ).format(date);
}

export default function TodoList() {
  return (
    <h1>To Do List for {formatDate(today)}</h1>
  );
}


```


### Where to use curly braces [](https://react.dev/learn/javascript-in-jsx-with-curly-braces#where-to-use-curly-braces "Link for Where to use curly braces")

You can only use curly braces in two ways inside JSX:

1. **As text** directly inside a JSX tag: `<h1>{name}'s To Do List</h1>` works, but `<{tag}>Gregorio Y. Zara's To Do List</{tag}>` will not.
2. **As attributes** immediately following the `=` sign: `src={avatar}` will read the `avatar` variable, but `src="{avatar}"` will pass the string `"{avatar}"`.

In addition to strings, numbers, and other JavaScript expressions, you can even pass objects in JSX. Objects are also denoted with curly braces, like `{ name: "Hedy Lamarr", inventions: 5 }`. Therefore, to pass a JS object in JSX, you must wrap the object in another pair of curly braces: `person={{ name: "Hedy Lamarr", inventions: 5 }}`.


```jsx
export default function TodoList() {
  return (
    <ul style={{
      backgroundColor: 'black',
      color: 'pink'
    }}>
      <li>Improve the videophone</li>
      <li>Prepare aeronautics lectures</li>
      <li>Work on the alcohol-fuelled engine</li>
    </ul>
  );
}




```

## rendering techniques

### rendering a list

```javascript
function App() {
  const animals = ["Lion", "Cow", "Snake", "Lizard"];
  return (
    <div>
      <h1>Animals: </h1>
      <ul>
        {animals.map((animal) => {
          return <li key={animal}>{animal}</li>;
        })}
      </ul>
    </div>
  );
}
```

```javascript
function App() {
  const animals = ["Lion", "Cow", "Snake", "Lizard"];
  const animalsList = animals.map((animal) => <li key={animal}>{animal}</li>)
  
  return (
    <div>
      <h1>Animals: </h1>
      <ul>
        {animalsList}
      </ul>
    </div>
  );
}
```

```javascript
function ListItem(props) {
  return <li>{props.animal}</li>
}

function List(props) {
  return (
    <ul>
      {props.animals.map((animal) => {
        return <ListItem key={animal} animal={animal} />;
      })}
    </ul>
  );
}

function App() {
  const animals = ["Lion", "Cow", "Snake", "Lizard"];

  return (
    <div>
      <h1>Animals: </h1>
      <List animals={animals} />
    </div>
  );
}
```

### Conditional rendering
#### ternary operator
```javascript
function List(props) {
  return (
    <ul>
      {props.animals.map((animal) => {
        return animal.startsWith("L") ? <li key={animal}>{animal}</li> : null;
      })}
    </ul>
  );
}

function App() {
  const animals = ["Lion", "Cow", "Snake", "Lizard"];

  return (
    <div>
      <h1>Animals: </h1>
      <List animals={animals} />
    </div>
  );
}
```

#### Using && operator ??
```javascript
function List(props) {
  return (
    <ul>
      {props.animals.map((animal) => {
        return animal.startsWith("L") && <li key={animal}>{animal}</li>;
      })}
    </ul>
  );
}

function App() {
  const animals = ["Lion", "Cow", "Snake", "Lizard"];

  return (
    <div>
      <h1>Animals: </h1>
      <List animals={animals} />
    </div>
  );
}
```

 **Falsy values in JSX, a common pitfall**

In JSX, values like `null`, `undefined`, and `false` do not render anything, and you might ask aren’t they falsy values? So you might think a value like `0` or an empty string does the same thing. It is a common pitfall. They are valid in JSX and will be rendered completely fine, so be sure to be aware of that!

#### Other ways of conditional rendering (if,else,switch)
```javascript
function List(props) {
  if (!props.animals) {
    return <div>Loading...</div>;
  }

  if (props.animals.length === 0) {
    return <div>There are no animals in the list!</div>;
  }

  return (
    <ul>
      {props.animals.map((animal) => {
        return <li key={animal}>{animal}</li>;
      })}
    </ul>
  );
}

function App() {
  const animals = [];

  return (
    <div>
      <h1>Animals: </h1>
      <List animals={animals} />
    </div>
  );
}
```

this could be done with other operator like ternary and &&
```javascript
function List(props) {
  return (
    <>
      {!props.animals ? (
        <div>Loading...</div>
      ) : props.animals.length > 0 ? (
        <ul>
          {props.animals.map((animal) => {
            return <li key={animal}>{animal}</li>;
          })}
        </ul>
      ) : (
        <div>There are no animals on the list!</div>
      )}
    </>
  );
}

// or
function List(props) {
  return (
    <>
      {!props.animals && <div>Loading...</div>}
      {props.animals && props.animals.length > 0 && (
        <ul>
          {props.animals.map((animal) => {
            return <li key={animal}>{animal}</li>;
          })}
        </ul>
      )}
      {props.animals && props.animals.length === 0 && <div>There are no animals in the list!</div>}
    </>
  );
}

function App() {
  const animals = [];

  return (
    <div>
      <h1>Animals: </h1>
      <List animals={animals} />
    </div>
  );
}
```

JSX elements directly inside a `map()` call always need keys!

## Keys

```jsx
const todos = [
  { task: "mow the yard", id: uuid() }, 
  { task: "Work on Odin Projects", id: uuid() },
  { task: "feed the cat", id: uuid() },
];

function TodoList() {
  return (
    <ul>
      {todos.map((todo) => (
        // here we are using the already generated id as the key.
        <li key={todo.id}>{todo.task}</li>
      ))}
    </ul>
  ) 
}
```


```jsx
     // DON'T do the following i.e. generating keys during render    
          <li key={uuid()}>{todo.task}</li>
```
## Props
props basic
```jsx
function Button(props) {

  const buttonStyle = {
    color: props.color,
    fontSize: props.fontSize + 'px'
  };

  return (
    <button style={buttonStyle}>{props.text}</button>
  )
}

export default function App() {
  return (
    <div>
      <Button text="Click Me!" color="blue" fontSize={12} />
      <Button text="Don't Click Me!" color="red" fontSize={12} />
      <Button text="Click Me!" color="blue" fontSize={20} />
    </div>
  );
}
```

props destructuring
```jsx
function Button({ text, color, fontSize }) {
  const buttonStyle = {
    color: color,
    fontSize: fontSize + "px"
  };

  return <button style={buttonStyle}>{text}</button>;
}

export default function App() {
  return (
    <div>
      <Button text="Click Me!" color="blue" fontSize={12} />
      <Button text="Don't Click Me!" color="red" fontSize={12} />
      <Button text="Click Me!" color="blue" fontSize={20} />
    </div>
  );
}
```

default props 2 ways
```jsx
function Button({ text, color, fontSize }) {
  const buttonStyle = {
    color: color,
    fontSize: fontSize + "px"
  };

  return <button style={buttonStyle}>{text}</button>;
}

Button.defaultProps = {
  text: "Click Me!",
  color: "blue",
  fontSize: 12
};

export default function App() {
  return (
    <div>
      <Button />
      <Button text="Don't Click Me!" color="red" />
      <Button fontSize={20} />
    </div>
  );
}
```

```jsx
function Button({ text = "Click Me!", color = "blue", fontSize = 12 }) {
  const buttonStyle = {
    color: color,
    fontSize: fontSize + "px"
  };

  return <button style={buttonStyle}>{text}</button>;
}
```


function in prop
```jsx
function Button({ text = "Click Me!", color = "blue", fontSize = 12, handleClick }) {
  const buttonStyle = {
    color: color,
    fontSize: fontSize + "px"
  };

  return (
    <button onClick={() => handleClick('https://www.theodinproject.com')} style={buttonStyle}>
      {text}
    </button>
  );
}

export default function App() {
  const handleButtonClick = (url) => {
    window.location.href = url;
  };

  return (
    <div>
      <Button handleClick={handleButtonClick} />
    </div>
  );
}
```

When supplying a parameter to the function we can’t just write `onClick={handleClick('www.theodinproject.com')}`, and instead must attach a reference to an anonymous function which then calls the function with the parameter. Like the previous example, this is to prevent the function being called during the render.

There are also other ways to implement this behavior. Hint: [curried functions!](https://javascript.info/currying-partials)









It is common to nest built-in browser tags:

```
<div>  <img /></div>
```

Sometimes you’ll want to nest your own components the same way:

```
<Card>  <Avatar /></Card>
```

When you nest content inside a JSX tag, the parent component will receive that content in a prop called `children`. For example, the `Card` component below will receive a `children` prop set to `<Avatar />` and render it in a wrapper div:

```jsx
import Avatar from './Avatar.js';

function Card({ children }) {
  return (
    <div className="card">
      {children}
    </div>
  );
}

export default function Profile() {
  return (
    <Card>
      <Avatar
        size={100}
        person={{ 
          name: 'Katsuko Saruhashi',
          imageId: 'YfeOqp2'
        }}
      />
    </Card>
  );
}

```
## State

```jsx
import { useState } from 'react';
import { sculptureList } from './data.js';

export default function Gallery() {
  const [index, setIndex] = useState(0);

  function handleClick() {
    setIndex(index + 1);
  }

  let sculpture = sculptureList[index];
  return (
    <>
      <button onClick={handleClick}>
        Next
      </button>
      <h2>
        <i>{sculpture.name} </i> 
        by {sculpture.artist}
      </h2>
      <h3>  
        ({index + 1} of {sculptureList.length})
      </h3>
      <img 
        src={sculpture.url} 
        alt={sculpture.alt}
      />
      <p>
        {sculpture.description}
      </p>
    </>
  );
}


```

**Hooks—functions starting with `use`—can only be called at the top level of your components or [your own Hooks.](https://react.dev/learn/reusing-logic-with-custom-hooks)** You can’t call Hooks inside conditions, loops, or other nested functions. Hooks are functions, but it’s helpful to think of them as unconditional declarations about your component’s needs. You “use” React features at the top of your component similar to how you “import” modules at the top of your file.


**State updater functions**

A trick question. Let’s look another implementation of `handleIncreaseAge`; what do you think it does?

```jsx
const handleIncreaseAge = () => {
   setPerson({ ...person, age: person.age + 1 });
   setPerson({ ...person, age: person.age + 1 });
}
```

Surely, it increase the age by 2? Nope. The above code is saying to React:

> Hey, replace the current render’s `person` with an increase in age by 1. Then, replace the current render’s `person` with an increase in age by 1.

Notice the word “replace”. When you pass in the value to the `setState` function, React will replace the current state with the value you passed in. You might be wondering, what if I want to update the state multiple times using the latest state? This is where the state updater function comes in.

```jsx
const handleIncreaseAge = () => {
   setPerson((prevPerson) => ({ ...prevPerson, age: prevPerson.age + 1 }));
   setPerson((prevPerson) => ({ ...prevPerson, age: prevPerson.age + 1 }));
}
```

**React batches state updates**

There are two `setPerson` calls in the above example, and from what we’ve learned so far, a `setState` call triggers a component re-render. So, the component should re-render twice, right? You would say yes, but React is smart. Wherever possible React batches the state updates. Here the component only re-renders once. We’d encourage you to use `console.log`s to verify this.


//state as a snapshot

lifting state up