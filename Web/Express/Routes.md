The first argument we pass a route is the path to match, which can either be a string or a regular expression. `/messages` matches that exactly, while `/message/all` only matches if the path is `/messages/all` (not `/messages`, nor `/messages/new`).

With string paths, we can also use certain symbols like `?`, `+`, `*` and `()` to provide some pattern-matching functionality, similar to regular expressions. For example:

```javascript
// ? makes a character optional
// The following path matches both /message and /messages
"/messages?"

// () groups characters together, allowing symbols to act on the group
// The following path matches both / and /messages
"/(messages)?"

// * is a wildcard matching any number of any characters
// The following path can match /foo/barbar and even /foo-FOO/bar3sdjsdfbar
"/foo*/bar*bar"
```

#### [Route parameters](https://www.theodinproject.com/lessons/nodejs-routes#route-parameters)

What if we wanted to have a route for all messages for any username, for example, `/odin/messages` or `/thor/messages`, or even `/theodinproject79687378/messages`? We could technically use `/*/messages`, but what if we wanted to extract and use the username in our middleware functions? Just like with React Router, we can use `route parameters`, and a path can contain as many of these parameters as we need.

To denote a route parameter, we start a segment with a `:` followed by the name of the parameter (which can only consist of case-sensitive alphanumeric characters, or `_`). Whatever we name that route parameter, Express will automatically populate the `req.params` object in any of the following middleware functions with whatever value the path passed into the parameter, using the parameter name as its key.



We might want our server to handle the following routes:

```text
GET /
GET /about
GET /contact
POST /contact

GET /books
GET /books/:bookId
GET /books/:bookId/reserve
POST /books/:bookId/reserve

GET /authors
GET /authors/:authorId
```

Copy

It’d be nice if we could extract the route groups to their own files, and we can do that using routers!

```javascript
// app.js
const express = require("express");
const app = express();
const booksRouter = require("routes/booksRouter");
const authorsRouter = require("routes/authorsRouter");
const indexRouter = require("routes/indexRouter");

app.use("/books", booksRouter);
app.use("/authors", authorsRouter);
app.use("/", indexRouter);

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`My first Express app - listening on port ${PORT}!`);
});
```

Copy

And what a router might look like:

```javascript
// routes/authorsRouter.js
const { Router } = require("express");

const authorsRouter = Router();

authorsRouter.get("/", (req, res) => res.send("All authors"));
authorsRouter.get("/:authorId", (req, res) => {
  const { authorId } = req.params;
  res.send(`Author ID: ${authorId}`);
});

module.exports = authorsRouter;
```

Copy

Now we can avoid having `app.js` littered with a million different routes! We can create individual files for routers, and place them neatly in their own `routes` directory.

In `routes/authorsRouter.js`, we destructure the Express object to get a Router function and use it to create our `authorsRouter`. We can use the same `.get` or `.post` methods on this router instead of on the whole server object, meaning we can write routes and router-level middleware (we will dive deeper into these in the next lesson)!

Back in `app.js`, we specify that any requests with paths starting with `/books` will be passed through `booksRouter` for route matching. If our request starts with `/authors`, it will skip these book routes and then check the routes in `authorsRouter` instead. Any other requests that don’t start with either of these will run through `indexRouter`.


1. No argument `next()` - Will pass control to the next middleware function. Very simple and straightforward.
2. With an error argument `next(new Error(...))` - Will pass control directly to the error middleware function.
3. With the string `next('route')` - Will pass control to the next route handler with the same matching path (if there is one). This only works for `app.METHOD` or `router.METHOD`. Potentially, it can also be the same as just calling `next` with no argument.
4. With the string `next('router')` - Will skip all middleware functions attached to the specific router instance and pass control back out of the router instance. Basically, we exit the router and go back to the parent router, e.g. `app` (yes, the Express app is also just a router under the hood).


```javascript
// errors/CustomNotFoundError.js

class CustomNotFoundError extends Error {
  constructor(message) {
    super(message);
    this.statusCode = 404;
    // So the error is neat when stringified. NotFoundError: message instead of Error: message
    this.name = "NotFoundError";
  }
}

module.exports = CustomNotFoundError;
```


```text
express-app/
├─ errors/
│  ├─ CustomNotFoundError.js
├─ controllers/
│  ├─ authorController.js
├─ routes/
│  ├─ authorRouter.js
│  ├─ ... other routers
├─ app.js
├─ db.js
```