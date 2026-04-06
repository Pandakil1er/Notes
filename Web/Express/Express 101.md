## Middleware
```javascript
const myLogger = function(req, res, next) {
  console.log("Request IP: " + req.ip);
  console.log("Request Method: " + req.method);
  console.log("Request date: " + new Date());

  next(); // THIS IS IMPORTANT!
}

app.use(myLogger)
```

http://expressjs.com/en/guide/using-middleware.html



### [MVC](https://www.theodinproject.com/lessons/nodejs-express-102-crud-and-mvc#mvc)

MVC is another common concept in web development and also something that is likely to come up in an interview question. MVC stands for _Model, View, Controller_ and refers to the architecture of your code. Basically, it is a way to organize your application by separating all of the actions into 3 main components: Models, Views and Controllers.

**Models** are the basic building blocks of your database. So for every type of entry in your DB (book, author, etc. in our Library Project), you’ll create a model that will hold the details of that type of entry. Models define the types of information that get used by your views and controllers.

**Views** are, of course, the component that generates the UI for your application. In our case, we’ve selected a templating engine that uses data supplied by a controller to display the desired information.

**Controllers** are the components that decide what view to display and what information is going to be put into it.