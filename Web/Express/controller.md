1. No argument `next()` - Will pass control to the next middleware function. Very simple and straightforward.
2. With an error argument `next(new Error(...))` - Will pass control directly to the error middleware function.
3. With the string `next('route')` - Will pass control to the next route handler with the same matching path (if there is one). This only works for `app.METHOD` or `router.METHOD`. Potentially, it can also be the same as just calling `next` with no argument.
4. With the string `next('router')` - Will skip all middleware functions attached to the specific router instance and pass control back out of the router instance. Basically, we exit the router and go back to the parent router, e.g. `app` (yes, the Express app is also just a router under the hood).


### [Consolidating what we’ve learned](https://www.theodinproject.com/lessons/nodejs-controllers#consolidating-what-weve-learned)

The following is the folder structure you’d end up with if you have been coding along:

```text
express-app/
├─ controllers/
│  ├─ userController.js
├─ routes/
│  ├─ userRoutes.js
├─ app.js
```


Creating a user controller file that contains well-defined responsibilities to handle “User”.

```javascript
// user controller file - controllers/userController.js

const asyncHandler = require("express-async-handler");

const getUserById = asyncHandler(async (req, res) => {
  const userId = req.params.id;

  const user = await someDBQueryToGetUser(userId);

  if (!user) {
    throw new CustomNotFoundError("User not found");
  }

  res.send(`User found: ${user.name}`);
});

const getUsers = asyncHandler(async (req, res) => {
  // code
});

const createUser = asyncHandler(async (req, res) => {
  // code
});

module.exports = { getUserById, getUsers, createUser };
```

Copy

Route file for the “User”

```javascript
// route file - routes/userRoutes.js

const express = require('express');
const userController = require('<path-to-user-controller>');

const router = express.Router();

// You can for example add a top level middleware function that handles say authentication and only let the request come in if they're authenticated
// This prevents from executing the middleware functions below if the request is not authenticated
// We will learn more about authentication in later lessons
// usually calls either next() or next(error)

// router.use(authMiddleware);

// router-level middlewares

// GET request for getting all the users
router.get('/', userController.getUsers);

// You will likely place your validation/authentication middleware functions here or perhaps in the controller file, e.g.
// router.post(validationMiddleware, userController.createUser)

// POST request for creating a user
router.post('/', userController.createUser);

// GET request for getting the user by id
router.get('/:id', userController.getUserById);

module.exports = router;
```

Copy

The main application file, our entry point.

```javascript
// app file

const express = require('express');
const userRouter = require('<path-to-user-routes>');

const app = express();

// application-level middlewares, will always execute on every incoming requests

// parses form payloads and sets it to the `req.body`
app.use(express.urlencoded({ extended: false }));

app.use((req, res, next) => {
  // You can of course also create your own for your own use-case!
  // Just make sure to call `next`
  next();
})

// base mount path is `/users` and will always execute on that specific mount path, and yes including `/users/a/b/c`
app.use('/users', userRouter);

const PORT = 3000;
app.listen(PORT, () => console.log(`listening on port ${PORT}!
```