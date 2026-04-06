

```js
const express = require("express");
const app = express();
const port = 3000;

app.get("/", function (req, res) {
  res.send("Hello World!");
});

app.listen(port, function () {
  console.log(`Example app listening on port ${port}!`);
});


```
The callback function takes a request and a response object as arguments. In this case, the method calls [`send()`](https://expressjs.com/en/4x/api.html#res.send) on the response to return the string "Hello World!" There are a [number of other response methods](https://expressjs.com/en/guide/routing.html#response-methods) for ending the request/response cycle, for example, you could call [`res.json()`](https://expressjs.com/en/4x/api.html#res.json) to send a JSON response or [`res.sendFile()`](https://expressjs.com/en/4x/api.html#res.sendFile) to send a file.

exports & imports 
```
exports.area = function (width) {
  return width * width;
};
exports.perimeter = function (width) {
  return 4 * width;
};



//app.js
const square = require("./square"); // Here we require() the name of the file without the (optional) .js file extension
console.log(`The area of a square with a width of 4 is ${square.area(4)}`);


```


The _Express application_ object also provides methods to define route handlers for all the other HTTP verbs, which are mostly used in exactly the same way:

`checkout()`, `copy()`, **`delete()`**, **`get()`**, `head()`, `lock()`, `merge()`, `mkactivity()`, `mkcol()`, `move()`, `m-search()`, `notify()`, `options()`, `patch()`, **`post()`**, `purge()`, **`put()`**, `report()`, `search()`, `subscribe()`, `trace()`, `unlock()`, `unsubscribe()`.

There is a special routing method, `app.all()`, which will be called in response to any HTTP method. This is used for loading middleware functions at a particular path for all request methods. The following example (from the Express documentation) shows a handler that will be executed for requests to `/secret` irrespective of the HTTP verb used (provided it is supported by the [http module](https://nodejs.org/docs/latest/api/http.html#httpmethods)).

```
app.all("/secret", function (req, res, next) {
  console.log("Accessing the secret section…");
  next(); // pass control to the next handler
});
```




Often it is useful to group route handlers for a particular part of a site together and access them using a common route-prefix (e.g. a site with a Wiki might have all wiki-related routes in one file and have them accessed with a route prefix of _/wiki/_). In _Express_ this is achieved by using the [`express.Router`](https://expressjs.com/en/guide/routing.html#express-router) object. For example, we can create our wiki route in a module named **wiki.js**, and then export the `Router` object, as shown below:

```
// wiki.js - Wiki route module

const express = require("express");
const router = express.Router();

// Home page route
router.get("/", function (req, res) {
  res.send("Wiki home page");
});

// About page route
router.get("/about", function (req, res) {
  res.send("About this wiki");
});

module.exports = router;
```

To use the router in our main app file we would then `require()` the route module (**wiki.js**), then call `use()` on the _Express_ application to add the Router to the middleware handling path. The two routes will then be accessible from `/wiki/` and `/wiki/about/`.

JSCopy to Clipboard

```
const wiki = require("./wiki.js");
// …
app.use("/wiki", wiki);
```






# Middleware
To use third party middleware you first need to install it into your app using npm. For example, to install the [morgan](https://expressjs.com/en/resources/middleware/morgan.html) HTTP request logger middleware, you'd do this:

BASHCopy to Clipboard

```
npm install morgan
```

You could then call `use()` on the _Express application object_ to add the middleware to the stack:

JSCopy to Clipboard

```
const express = require("express");
const logger = require("morgan");
const app = express();
app.use(logger("dev"));
// …
```


You can write your own middleware functions, and you are likely to have to do so (if only to create error handling code). The **only** difference between a middleware function and a route handler callback is that middleware functions have a third argument `next`, which middleware functions are expected to call if they are not that which completes the request cycle (when the middleware function is called, this contains the _next_ function that must be called).

You can add a middleware function to the processing chain for _all responses_ with `app.use()`, or for a specific HTTP verb using the associated method: `app.get()`, `app.post()`, etc. Routes are specified in the same way for both cases, though the route is optional when calling `app.use()`.

The example below shows how you can add the middleware function using both approaches, and with/without a route.

JSCopy to Clipboard

```
const express = require("express");
const app = express();

// An example middleware function
const a_middleware_function = function (req, res, next) {
  // Perform some operations
  next(); // Call next() so Express will call the next middleware function in the chain.
};

// Function added with use() for all routes and verbs
app.use(a_middleware_function);

// Function added with use() for a specific route
app.use("/someroute", a_middleware_function);

// A middleware function added for a specific HTTP verb and route
app.get("/", a_middleware_function);

app.listen(3000);
```


# Serving static files
You can use the [express.static](https://expressjs.com/en/4x/api.html#express.static) middleware to serve static files, including your images, CSS and JavaScript (`static()` is the only middleware function that is actually **part** of _Express_). For example, you would use the line below to serve images, CSS files, and JavaScript files from a directory named '**public'** at the same level as where you call node:

JSCopy to Clipboard

```
app.use(express.static("public"));
```

Any files in the public directory are served by adding their filename (_relative_ to the base "public" directory) to the base URL. So for example:

http://localhost:3000/images/dog.jpg
http://localhost:3000/css/style.css
http://localhost:3000/js/app.js
http://localhost:3000/about.html

You can call `static()` multiple times to serve multiple directories. If a file cannot be found by one middleware function then it will be passed on to the subsequent middleware (the order that middleware is called is based on your declaration order).

JSCopy to Clipboard

```
app.use(express.static("public"));
app.use(express.static("media"));
```

You can also create a virtual prefix for your static URLs, rather than having the files added to the base URL. For example, here we [specify a mount path](https://expressjs.com/en/4x/api.html#app.use) so that the files are loaded with the prefix "/media":

JSCopy to Clipboard

```
app.use("/media", express.static("public"));
```

Now, you can load the files that are in the `public` directory from the `/media` path prefix.

http://localhost:3000/media/images/dog.jpg
http://localhost:3000/media/video/cat.mp4
http://localhost:3000/media/cry.mp3


# [Handling errors](https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/Introduction#handling_errors)

Errors are handled by one or more special middleware functions that have four arguments, instead of the usual three: `(err, req, res, next)`. For example:

JSCopy to Clipboard

```
app.use(function (err, req, res, next) {
  console.error(err.stack);
  res.status(500).send("Something broke!");
});
```

These can return any content required, but must be called after all other `app.use()` and routes calls so that they are the last middleware in the request handling process!

Express comes with a built-in error handler, which takes care of any remaining errors that might be encountered in the app. This default error-handling middleware function is added at the end of the middleware function stack. If you pass an error to `next()` and you do not handle it in an error handler, it will be handled by the built-in error handler; the error will be written to the client with the stack trace.


# [Using databases](https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/Introduction#using_databases)

This works with older versions of MongoDB version ~ 2.2.33:

JSCopy to Clipboard

```
const MongoClient = require("mongodb").MongoClient;

MongoClient.connect("mongodb://localhost:27017/animals", (err, db) => {
  if (err) throw err;

  db.collection("mammals")
    .find()
    .toArray((err, result) => {
      if (err) throw err;

      console.log(result);
    });
});
```

For MongoDB version 3.0 and up:

JSCopy to Clipboard

```
const MongoClient = require("mongodb").MongoClient;

MongoClient.connect("mongodb://localhost:27017/animals", (err, client) => {
  if (err) throw err;

  const db = client.db("animals");
  db.collection("mammals")
    .find()
    .toArray((err, result) => {
      if (err) throw err;
      console.log(result);
      client.close();
    });
});
```

Another popular approach is to access your database indirectly, via an Object Relational Mapper ("ORM"). In this approach you define your data as "objects" or "models" and the ORM maps these through to the underlying database format. This approach has the benefit that as a developer you can continue to think in terms of JavaScript objects rather than database semantics, and that there is an obvious place to perform validation and checking of incoming data. We'll talk more about databases in a later article.



# [Rendering data (views)](https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/Introduction#rendering_data_views)

Template engines (also referred to as "view engines" by _Express_'s documentation) allow you to specify the _structure_ of an output document in a template, using placeholders for data that will be filled in when a page is generated. Templates are often used to create HTML, but can also create other types of documents. Express has support for [a number of template engines](https://github.com/expressjs/express/wiki#template-engines), and there is a useful comparison of the more popular engines here: [Comparing JavaScript Templating Engines: Jade, Mustache, Dust and More](https://strongloop.com/strongblog/compare-javascript-templates-jade-mustache-dust/).

In your application settings code you set the template engine to use and the location where Express should look for templates using the 'views' and 'view engine' settings, as shown below (you will also have to install the package containing your template library too!)

JSCopy to Clipboard

```
const express = require("express");
const path = require("path");
const app = express();

// Set directory to contain the templates ('views')
app.set("views", path.join(__dirname, "views"));

// Set view engine to use, in this case 'some_template_engine_name'
app.set("view engine", "some_template_engine_name");
```

The appearance of the template will depend on what engine you use. Assuming that you have a template file named "index.<template_extension>" that contains placeholders for data variables named 'title' and "message", you would call [`Response.render()`](https://expressjs.com/en/4x/api.html#res.render) in a route handler function to create and send the HTML response:

JSCopy to Clipboard

```
app.get("/", function (req, res) {
  res.render("index", { title: "About dogs", message: "Dogs rock!" });
});
```



