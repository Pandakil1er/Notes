https://www.theodinproject.com/lessons/node-path-react-new-refs-and-memoization

useMemo
Memo - https://react.dev/reference/react/memo
useCallback





useRef - https://react.dev/reference/react/useRef

```jsx
import { useRef } from 'react';

export default function Counter() {
  let ref = useRef(0);

  function handleClick() {
    ref.current = ref.current + 1;
    alert('You clicked ' + ref.current + ' times!');
  }

  return (
    <button onClick={handleClick}>
      Click me!
    </button>
  );
}


```
### I can’t get a ref to a custom component [](https://react.dev/reference/react/useRef#i-cant-get-a-ref-to-a-custom-component "Link for I can’t get a ref to a custom component")

If you try to pass a `ref` to your own component like this:

```
const inputRef = useRef(null);return <MyInput ref={inputRef} />;
```

You might get an error in the console:

Console

Warning: Function components cannot be given refs. Attempts to access this ref will fail. Did you mean to use React.forwardRef()?

By default, your own components don’t expose refs to the DOM nodes inside them.

To fix this, find the component that you want to get a ref to:

```
export default function MyInput({ value, onChange }) {  return (    <input      value={value}      onChange={onChange}    />  );}
```

And then wrap it in [`forwardRef`](https://react.dev/reference/react/forwardRef) like this:

```
import { forwardRef } from 'react';const MyInput = forwardRef(({ value, onChange }, ref) => {  return (    <input      value={value}      onChange={onChange}      ref={ref}    />  );});export default MyInput;
```

Then the parent component can get a ref to it.