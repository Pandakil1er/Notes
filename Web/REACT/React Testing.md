

https://www.theodinproject.com/lessons/node-path-react-new-introduction-to-react-testing

https://www.robinwieruch.de/vitest-react-testing-library/

```
npm install @testing-library/user-event --save-dev
```

Now that we have everything we need, let’s briefly go over what some of those packages do. We’ll primarily focus on the `@testing-library` packages.

- `@testing-library/react` will give us access to useful functions like `render` which we’ll demonstrate later on.
    
- `@testing-library/jest-dom` includes some handy custom matchers (assertive functions) like `toBeInTheDocument` and more. (complete list on [jest-dom’s github](https://github.com/testing-library/jest-dom)). Jest already has a lot of matchers so this package is not compulsory to use.
    
- `@testing-library/user-event` provides the `userEvent` API that simulates user interactions with the webpage. Alternatively, we could import the `fireEvent` API from `@testing-library/react`.
    
    `fireEvent` is an inferior counterpart to `userEvent` and `userEvent` should always be preferred in practice.



https://testing-library.com/docs/dom-testing-library/cheatsheet/