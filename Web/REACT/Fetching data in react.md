

https://www.theodinproject.com/lessons/node-path-react-new-fetching-data-in-react


### [Using custom hooks](https://www.theodinproject.com/lessons/node-path-react-new-fetching-data-in-react#using-custom-hooks)

We can separate out the fetching logic altogether into a custom hook. This will allow us to make the logic reusable and easily testable.

Here’s how we would do it for our example:

```jsx
import { useState, useEffect } from "react";

const useImageURL = () => {
  const [imageURL, setImageURL] = useState(null);
  const [error, setError] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch("https://jsonplaceholder.typicode.com/photos", { mode: "cors" })
      .then((response) => {
        if (response.status >= 400) {
          throw new Error("server error");
        }
        return response.json();
      })
      .then((response) => setImageURL(response[0].url))
      .catch((error) => setError(error))
      .finally(() => setLoading(false));
  }, []);

  return { imageURL, error, loading };
};

const Image = () => {
  const { imageURL, error, loading } = useImageURL();

  if (error) return <p>A network error was encountered</p>;
  if (loading) return <p>Loading...</p>;

  return (
    <>
      <h1>An image</h1>
      <img src={imageURL} alt={"placeholder text"} />
    </>
  );
};
```


https://codesandbox.io/p/sandbox/github/TheOdinProject/react-examples/tree/main/fetching-data-example?file=%2Fsrc%2FProfile.jsx%3A1%2C1&embed=1
If we remove the short-circuiting conditional that waits for `imageURL`, `Bio` would send a request immediately, but that would mean abandoning our loading screen. Instead of compromising on design, we can lift the request up the component tree and pass its response as a prop to `Bio`.



waterfall when fetching data