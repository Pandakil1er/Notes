https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/mongoose

```
// Import the mongoose module
const mongoose = require("mongoose");

// Set `strictQuery: false` to globally opt into filtering by properties that aren't in the schema
// Included because it removes preparatory warnings for Mongoose 7.
// See: https://mongoosejs.com/docs/migrating_to_6.html#strictquery-is-removed-and-replaced-by-strict
mongoose.set("strictQuery", false);

// Define the database URL to connect to.
const mongoDB = "mongodb://127.0.0.1/my_database";

// Wait for database to connect, logging an error if there is a problem
main().catch((err) => console.log(err));
async function main() {
  await mongoose.connect(mongoDB);
}
```


create Schema
```
// Require Mongoose
const mongoose = require("mongoose");

// Define a schema
const Schema = mongoose.Schema;

const SomeModelSchema = new Schema({
  a_string: String,
  a_date: Date,
});
```

create model

```
// Define schema
const Schema = mongoose.Schema;

const SomeModelSchema = new Schema({
  a_string: String,
  a_date: Date,
});

// Compile model from schema
const SomeModel = mongoose.model("SomeModel", SomeModelSchema);
```


schema types
```
const schema = new Schema({
  name: String,
  binary: Buffer,
  living: Boolean,
  updated: { type: Date, default: Date.now() },
  age: { type: Number, min: 18, max: 65, required: true },
  mixed: Schema.Types.Mixed,
  _someId: Schema.Types.ObjectId,
  array: [],
  ofString: [String], // You can also have an array of each of the other types too.
  nested: { stuff: { type: String, lowercase: true, trim: true } },
});
```



#### Validation

Mongoose provides built-in and custom validators, and synchronous and asynchronous validators. It allows you to specify both the acceptable range of values and the error message for validation failure in all cases.

The built-in validators include:

- All [SchemaTypes](https://mongoosejs.com/docs/schematypes.html) have the built-in [required](https://mongoosejs.com/docs/api.html#schematype_SchemaType-required) validator. This is used to specify whether the field must be supplied in order to save a document.
- [Numbers](https://mongoosejs.com/docs/api/schemanumber.html) have [min](https://mongoosejs.com/docs/api/schemanumber.html#SchemaNumber.prototype.min()) and [max](https://mongoosejs.com/docs/api/schemanumber.html#SchemaNumber.prototype.max()) validators.
- [Strings](https://mongoosejs.com/docs/api/schemastring.html) have:
    - [enum](https://mongoosejs.com/docs/api/schemastring.html#SchemaString.prototype.enum()): specifies the set of allowed values for the field.
    - [match](https://mongoosejs.com/docs/api/schemastring.html#SchemaString.prototype.match()): specifies a regular expression that the string must match.
    - [maxLength](https://mongoosejs.com/docs/api/schemastring.html#SchemaString.prototype.maxlength()) and [minLength](https://mongoosejs.com/docs/api/schemastring.html#SchemaString.prototype.minlength()) for the string.

The example below (slightly modified from the Mongoose documents) shows how you can specify some of the validator types and error messages:

JSCopy to Clipboard

```
const breakfastSchema = new Schema({
  eggs: {
    type: Number,
    min: [6, "Too few eggs"],
    max: 12,
    required: [true, "Why no eggs?"],
  },
  drink: {
    type: String,
    enum: ["Coffee", "Tea", "Water"],
  },
});
```

### Query