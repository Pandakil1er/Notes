
## Reducer
Managing state with reducers is slightly different from directly setting state. Instead of telling React “what to do” by setting state, you specify “what the user just did” by dispatching “actions” from your event handlers. (The state update logic will live elsewhere!) So instead of “setting `tasks`” via an event handler, you’re dispatching an “added/changed/deleted a task” action. This is more descriptive of the user’s intent.

```jsx
function handleAddTask(text) {
  dispatch({
    type: 'added',
    id: nextId++,
    text: text,
  });
}

function handleChangeTask(task) {
  dispatch({
    type: 'changed',
    task: task,
  });
}

function handleDeleteTask(taskId) {
  dispatch({
    type: 'deleted',
    id: taskId,
  });
}
```

The object you pass to `dispatch` is called an “action”:

```jsx
function handleDeleteTask(taskId) {  

dispatch(  

// "action" object:  

{  

type: 'deleted',  

id: taskId,  

}  

);  

}
```





An action object can have any shape.

By convention, it is common to give it a string `type` that describes what happened, and pass any additional information in other fields. The `type` is specific to a component, so in this example either `'added'` or `'added_task'` would be fine. Choose a name that says what happened!

```jsx
dispatch({  

// specific to component  

type: 'what_happened',  

// other fields go here  

});
```





```jsx
function tasksReducer(tasks, action) {  

if (action.type === 'added') {  

return [  

...tasks,  

{  

id: action.id,  

text: action.text,  

done: false,  

},  

];  

} else if (action.type === 'changed') {  

return tasks.map((t) => {  

if (t.id === action.task.id) {  

return action.task;  

} else {  

return t;  

}  

});  

} else if (action.type === 'deleted') {  

return tasks.filter((t) => t.id !== action.id);  

} else {  

throw Error('Unknown action: ' + action.type);  

}  

}

```
The code above uses if/else statements, but it’s a convention to use [switch statements](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Statements/switch) inside reducers. The result is the same, but it can be easier to read switch statements at a glance.


```jsx
function tasksReducer(tasks, action) {
  switch (action.type) {
    case 'added': {
      return [
        ...tasks,
        {
          id: action.id,
          text: action.text,
          done: false,
        },
      ];
    }
    case 'changed': {
      return tasks.map((t) => {
        if (t.id === action.task.id) {
          return action.task;
        } else {
          return t;
        }
      });
    }
    case 'deleted': {
      return tasks.filter((t) => t.id !== action.id);
    }
    default: {
      throw Error('Unknown action: ' + action.type);
    }
  }
}

```

We recommend wrapping each `case` block into the `{` and `}` curly braces so that variables declared inside of different `case`s don’t clash with each other. Also, a `case` should usually end with a `return`. If you forget to `return`, the code will “fall through” to the next `case`, which can lead to mistakes!

If you’re not yet comfortable with switch statements, using if/else is completely fine.



- To convert from `useState` to `useReducer`:
    1. Dispatch actions from event handlers.
    2. Write a reducer function that returns the next state for a given state and action.
    3. Replace `useState` with `useReducer`.
- Reducers require you to write a bit more code, but they help with debugging and testing.
- Reducers must be pure.
- Each action describes a single user interaction.
- Use Immer if you want to write reducers in a mutating style.


## useReducer
https://react.dev/reference/react/useReducer