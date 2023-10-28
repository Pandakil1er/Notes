To simplify our application and reduce complexity, we can implement the Context API. There are three key elements in this API that we need to understand:

1. `createContext` - This “creates the context” Duh… But yes, it’s how we can create the context. It takes in any value, be it a number, string, or object, which can be referred to as the _default value_ of the context, and returns a context object that can be used to pass down data to components
2. `useContext` - This hook is used to consume data from a context object created by `createContext`. We can use this hook inside our component to retrieve the data that we need. This hook accepts the context object as an argument
3. `ContextObject.Provider` - The context object comes with the `Provider` component that accepts a prop called `value`, which is the context value that’s going to be passed down to the components no matter how deeply they’re nested. In other words, a way to “provide” the context value to these components

```jsx
import { useState, createContext } from 'react';
// other imports for Header and ProductDetail

export const ShopContext = createContext({
  products: [],
  cartItems: [],
  addToCart: () => {},
});

export default function App() {
  const [cartItems, setCartItems] = useState([
    /* List of Items in Cart */
  ]);
  const products = /* some custom hook that fetches products and returns the fetched products */

  const addToCart = () => {
    // add to cart logic (this adds to cartItems)
  };

  return (
    /* We are going to pass the things that we want to inject to these components using the value prop */
    /* This value prop will overwrite the default value */
    <ShopContext.Provider value={{ cartItems, products, addToCart }}>
      <Header />
      <ProductDetail />
    </ShopContext.Provider>
  );
}
```

```jsx
import { useContext } from "react";
// import for ShopContext

export default function ProductDetail() {
  const { products, addToCart } = useContext(ShopContext);
  const product = products.find(/* Logic to find the specific product */);

  return (
    <div>
      {/* Image of the product */}
      <div>
        {/* elements that align with the design */}
        <button type="button" onClick={() => addToCart(product)}>
          Add to Cart
        </button>
      </div>
    </div>
  );
}
```

### [Drawbacks of using Context API](https://www.theodinproject.com/lessons/node-path-react-new-managing-state-with-the-context-api#drawbacks-of-using-context-api)

Although the Context API can be a powerful tool for managing state in larger React applications, it also has some drawbacks that you should be aware of:

1. It can lead to performance issues: When you update the state in a context, it can cause all components that are consuming that context to re-render, even if the state that they are using hasn’t changed. This can lead to performance issues, especially if you have a lot of components that are consuming the same context.
2. It can make your code harder to follow: With the Context API, it’s easier to access the state from any component in your application. However, this can also make your code harder to follow, especially if you have a lot of nested components that are consuming the same context. It’s important to keep your code organized and well-structured to avoid confusion.

### [Potential solutions](https://www.theodinproject.com/lessons/node-path-react-new-managing-state-with-the-context-api#potential-solutions)

1. Use multiple smaller contexts instead of a single large context. Instead of using a single large context to manage all of your application states, consider using multiple smaller contexts to manage related pieces of state. This can help to reduce the number of components that are consuming the context and minimize unnecessary re-renders.
2. Sometimes Context API might not even be the best solution for the problems that we want to deal with. Take a look at [React Component Composition](https://www.robinwieruch.de/react-component-composition/) article by Robin Wieruch.
3. You can rely on external state management systems like [Zustand](https://github.com/pmndrs/zustand) and [Redux](https://redux.js.org/). They have a lot of optimizations built-in and are feature rich. Unfortunately, they do have a learning curve, and we recommend sticking to the Context API for the rest of this course as it’s still reliable for majority of the projects we’re going to build.