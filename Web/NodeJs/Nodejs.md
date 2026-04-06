 “As an asynchronous event driven JavaScript runtime, Node is designed to build scalable network applications.”



package.json me "type":"module" to use esmodule imports


# Running node in terminal
```sh
node test.js

node -e "console.log("hi")"

```

Above, you are explicitly telling the shell to run your script with `node`. You can also embed this information into your JavaScript file with a "shebang" line. The "shebang" is the first line in the file, and tells the OS which interpreter to use for running the script. Below is the first line of JavaScript:

```js
#!/usr/bin/node
```

Above, we are explicitly giving the absolute path of interpreter. Not all operating systems have `node` in the bin folder, but all should have `env`. You can tell the OS to run `env` with node as parameter:

```js
#!/usr/bin/env node

// your code
```

To use a shebang, your file should have executable permission. You can give `app.js` the executable permission by running:

```shell
chmod u+x app.js
```

# .env
The `process` core module of Node.js provides the `env` property which hosts all the environment variables that were set at the moment the process was started.

The below code runs `app.js` and set `USER_ID` and `USER_KEY`.

```shell
USER_ID=239482 USER_KEY=foobar node app.js
```

That will pass the user `USER_ID` as **239482** and the `USER_KEY` as **foobar**. This is suitable for testing, however for production, you will probably be configuring some bash scripts to export variables.

> Note: `process` does not require a "require", it's automatically available.

Here is an example that accesses the `USER_ID` and `USER_KEY` environment variables, which we set in above code.

```js
process.env.USER_ID; // "239482"
process.env.USER_KEY; // "foobar"
```

In the same way you can access any custom environment variable you set.

If you have multiple environment variables in your node project, you can also create an `.env` file in the root directory of your project, and then use the [dotenv](https://www.npmjs.com/package/dotenv) package to load them during runtime.

```shell
# .env file
USER_ID="239482"
USER_KEY="foobar"
NODE_ENV="development"
```

In your js file

```js
require('dotenv').config();

process.env.USER_ID; // "239482"
process.env.USER_KEY; // "foobar"
process.env.NODE_ENV; // "development"
```

> You can also run your js file with `node -r dotenv/config index.js` command if you don't want to import the package in your code.


Create a `.env` file in the root of your project:

```ini
S3_BUCKET="YOURS3BUCKET"
SECRET_KEY="YOURSECRETKEYGOESHERE"
```

```js
require('dotenv').config()

```
# http
A GET request is possible just using the Node.js standard modules, although it's more verbose than the option above:

```js
const https = require('https');

const options = {
  hostname: 'example.com',
  port: 443,
  path: '/todos',
  method: 'GET',
};

const req = https.request(options, res => {
  console.log(`statusCode: ${res.statusCode}`);

  res.on('data', d => {
    process.stdout.write(d);
  });
});

req.on('error', error => {
  console.error(error);
});

req.end();
```
# fs
The `fs` module provides a lot of very useful functionality to access and interact with the file system.

There is no need to install it. Being part of the Node.js core, it can be used by simply requiring it:

```js
const fs = require('fs');
```

Once you do so, you have access to all its methods, which include:

- `fs.access()`: check if the file exists and Node.js can access it with its permissions
- `fs.appendFile()`: append data to a file. If the file does not exist, it's created
- `fs.chmod()`: change the permissions of a file specified by the filename passed. Related: `fs.lchmod()`, `fs.fchmod()`
- `fs.chown()`: change the owner and group of a file specified by the filename passed. Related: `fs.fchown()`, `fs.lchown()`
- `fs.close()`: close a file descriptor
- `fs.copyFile()`: copies a file
- `fs.createReadStream()`: create a readable file stream
- `fs.createWriteStream()`: create a writable file stream
- `fs.link()`: create a new hard link to a file
- `fs.mkdir()`: create a new folder
- `fs.mkdtemp()`: create a temporary directory
- `fs.open()`: opens the file and returns a file descriptor to allow file manipulation
- `fs.readdir()`: read the contents of a directory
- `fs.readFile()`: read the content of a file. Related: `fs.read()`
- `fs.readlink()`: read the value of a symbolic link
- `fs.realpath()`: resolve relative file path pointers (`.`, `..`) to the full path
- `fs.rename()`: rename a file or folder
- `fs.rmdir()`: remove a folder
- `fs.stat()`: returns the status of the file identified by the filename passed. Related: `fs.fstat()`, `fs.lstat()`
- `fs.symlink()`: create a new symbolic link to a file
- `fs.truncate()`: truncate to the specified length the file identified by the filename passed. Related: `fs.ftruncate()`
- `fs.unlink()`: remove a file or a symbolic link
- `fs.unwatchFile()`: stop watching for changes on a file
- `fs.utimes()`: change the timestamp of the file identified by the filename passed. Related: `fs.futimes()`
- `fs.watchFile()`: start watching for changes on a file. Related: `fs.watch()`
- `fs.writeFile()`: write data to a file. Related: `fs.write()`

One peculiar thing about the `fs` module is that all the methods are asynchronous by default, but they can also work synchronously by appending `Sync`.

For example:

- `fs.rename()`
- `fs.renameSync()`
- `fs.write()`
- `fs.writeSync()`

This makes a huge difference in your application flow.

> Node.js 10 includes [experimental support](https://nodejs.org/api/fs.html#fs_fs_promises_api) for a promise based API

For example let's examine the `fs.rename()` method. The asynchronous API is used with a callback:

```js
const fs = require('fs');

fs.rename('before.json', 'after.json', err => {
  if (err) {
    return console.error(err);
  }

  // done
});
```

A synchronous API can be used like this, with a try/catch block to handle errors:

```js
const fs = require('fs');

try {
  fs.renameSync('before.json', 'after.json');
  // done
} catch (err) {
  console.error(err);
}
```

The key difference here is that the execution of your script will block in the second example, until the file operation succeeded.

You can use promise-based API provided by `fs/promises` module to avoid using callback-based API, which may cause [callback hell](http://callbackhell.com/). Here is an example:

```js
// Example: Read a file and change its content and read
// it again using callback-based API.
const fs = require('fs');

const fileName = '/Users/joe/test.txt';
fs.readFile(fileName, 'utf8', (err, data) => {
  if (err) {
    console.log(err);
    return;
  }
  console.log(data);
  const content = 'Some content!';
  fs.writeFile(fileName, content, err2 => {
    if (err2) {
      console.log(err2);
      return;
    }
    console.log('Wrote some content!');
    fs.readFile(fileName, 'utf8', (err3, data3) => {
      if (err3) {
        console.log(err3);
        return;
      }
      console.log(data3);
    });
  });
});
```

The callback-based API may rise a callback hell when there are too many nested callbacks. We can simply use promise-based API to avoid it:

```js
// Example: Read a file and change its content and read
// it again using promise-based API.
const fs = require('fs/promises');

async function example() {
  const fileName = '/Users/joe/test.txt';
  try {
    const data = await fs.readFile(fileName, 'utf8');
    console.log(data);
    const content = 'Some content!';
    await fs.writeFile(fileName, content);
    console.log('Wrote some content!');
    const newData = await fs.readFile(fileName, 'utf8');
    console.log(newData);
  } catch (err) {
    console.log(err);
  }
}
example();
```
# Write and Read with fs
**Write**
The easiest way to write to files in Node.js is to use the `fs.writeFile()` API.

Example:

```js
const fs = require('fs');

const content = 'Some content!';

fs.writeFile('/Users/joe/test.txt', content, err => {
  if (err) {
    console.error(err);
  }
  // file written successfully
});
```

Alternatively, you can use the synchronous version `fs.writeFileSync()`:

```js
const fs = require('fs');

const content = 'Some content!';

try {
  fs.writeFileSync('/Users/joe/test.txt', content);
  // file written successfully
} catch (err) {
  console.error(err);
}
```

You can also use the promise-based `fsPromises.writeFile()` method offered by the `fs/promises` module:

```js
const fs = require('fs/promises');

async function example() {
  try {
    const content = 'Some content!';
    await fs.writeFile('/Users/joe/test.txt', content);
  } catch (err) {
    console.log(err);
  }
}
example();
```

By default, this API will **replace the contents of the file** if it does already exist.

You can modify the default by specifying a flag:

```js
fs.writeFile('/Users/joe/test.txt', content, { flag: 'a+' }, err => {});
```

The flags you'll likely use are

- `r+` open the file for reading and writing
- `w+` open the file for reading and writing, positioning the stream at the beginning of the file. The file is created if it does not exist
- `a` open the file for writing, positioning the stream at the end of the file. The file is created if it does not exist
- `a+` open the file for reading and writing, positioning the stream at the end of the file. The file is created if it does not exist

(you can find more flags at [https://nodejs.org/api/fs.html#fs_file_system_flags](https://nodejs.org/api/fs.html#fs_file_system_flags))

## [Append to a file](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/manipulating-files/node-writing-files.en.md#append-to-a-file)

A handy method to append content to the end of a file is `fs.appendFile()` (and its `fs.appendFileSync()` counterpart):

```js
const fs = require('fs');

const content = 'Some content!';

fs.appendFile('file.log', content, err => {
  if (err) {
    console.error(err);
  }
  // done!
});
```

Here is a `fsPromises.appendFile()` example:

```js
const fs = require('fs/promises');

async function example() {
  try {
    const content = 'Some content!';
    await fs.appendFile('/Users/joe/test.txt', content);
  } catch (err) {
    console.log(err);
  }
}
example();
```

## [Using streams](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/manipulating-files/node-writing-files.en.md#using-streams)

All those methods write the full content to the file before returning the control back to your program (in the async version, this means executing the callback)

In this case, a better option is to write the file content using streams.

**Read**
The simplest way to read a file in Node.js is to use the `fs.readFile()` method, passing it the file path, encoding and a callback function that will be called with the file data (and the error):

```js
const fs = require('fs');

fs.readFile('/Users/joe/test.txt', 'utf8', (err, data) => {
  if (err) {
    console.error(err);
    return;
  }
  console.log(data);
});
```

Alternatively, you can use the synchronous version `fs.readFileSync()`:

```js
const fs = require('fs');

try {
  const data = fs.readFileSync('/Users/joe/test.txt', 'utf8');
  console.log(data);
} catch (err) {
  console.error(err);
}
```

You can also use the promise-based `fsPromises.readFile()` method offered by the `fs/promises` module:

```js
const fs = require('fs/promises');

async function example() {
  try {
    const data = await fs.readFile('/Users/joe/test.txt', { encoding: 'utf8' });
    console.log(data);
  } catch (err) {
    console.log(err);
  }
}
example();
```

All three of `fs.readFile()`, `fs.readFileSync()` and `fsPromises.readFile()` read the full content of the file in memory before returning the data.

This means that big files are going to have a major impact on your memory consumption and speed of execution of the program.

In this case, a better option is to read the file content using streams.


# URL class
https://nodejs.org/api/url.html#url_the_whatwg_url_api

# NPM
## [Introduction to npm](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-package-manager/npm.en.md#introduction-to-npm)

`npm` is the standard package manager for Node.js.

In September 2022 over 2.1 million packages were reported being listed in the npm registry, making it the biggest single language code repository on Earth, and you can be sure there is a package for (almost!) everything.

It started as a way to download and manage dependencies of Node.js packages, but it has since become a tool used also in frontend JavaScript.

There are many things that `npm` does.

> [**Yarn**](https://yarnpkg.com/en/) and [**pnpm**](https://pnpm.io/) are alternatives to npm cli. You can check them out as well.

## [Downloads](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-package-manager/npm.en.md#downloads)

`npm` manages downloads of dependencies of your project.

### [Installing all dependencies](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-package-manager/npm.en.md#installing-all-dependencies)

If a project has a `package.json` file, by running

```shell
npm install
```

it will install everything the project needs, in the `node_modules` folder, creating it if it's not existing already.

### [Installing a single package](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-package-manager/npm.en.md#installing-a-single-package)

You can also install a specific package by running

```shell
npm install <package-name>
```

Furthermore, since npm 5, this command adds `<package-name>` to the `package.json` file _dependencies_. Before version 5, you needed to add the flag `--save`.

Often you'll see more flags added to this command:

- `--save-dev` installs and adds the entry to the `package.json` file _devDependencies_
- `--no-save` installs but does not add the entry to the `package.json` file _dependencies_
- `--save-optional` installs and adds the entry to the `package.json` file _optionalDependencies_
- `--no-optional` will prevent optional dependencies from being installed

Shorthands of the flags can also be used:

- -S: --save
- -D: --save-dev
- -O: --save-optional

The difference between _devDependencies_ and _dependencies_ is that the former contains development tools, like a testing library, while the latter is bundled with the app in production.

As for the _optionalDependencies_ the difference is that build failure of the dependency will not cause installation to fail. But it is your program's responsibility to handle the lack of the dependency. Read more about [optional dependencies](https://docs.npmjs.com/cli/v7/configuring-npm/package-json#optionaldependencies).

### [Updating packages](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-package-manager/npm.en.md#updating-packages)

Updating is also made easy, by running

```shell
npm update
```

`npm` will check all packages for a newer version that satisfies your versioning constraints.

You can specify a single package to update as well:

```shell
npm update <package-name>
```

## [Versioning](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-package-manager/npm.en.md#versioning)

In addition to plain downloads, `npm` also manages **versioning**, so you can specify any specific version of a package, or require a version higher or lower than what you need.

Many times you'll find that a library is only compatible with a major release of another library.

Or a bug in the latest release of a lib, still unfixed, is causing an issue.

Specifying an explicit version of a library also helps to keep everyone on the same exact version of a package, so that the whole team runs the same version until the `package.json` file is updated.

In all those cases, versioning helps a lot, and `npm` follows the semantic versioning (semver) standard.

You can install a specific version of a package, by running

```shell
npm install <package-name>@<version>
```

## [Running Tasks](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-package-manager/npm.en.md#running-tasks)

The package.json file supports a format for specifying command line tasks that can be run by using

```shell
npm run <task-name>
```

For example:

```json
{
  "scripts": {
    "start-dev": "node lib/server-development",
    "start": "node lib/server-production"
  }
}
```

It's very common to use this feature to run Webpack:

```json
{
  "scripts": {
    "watch": "webpack --watch --progress --colors --config webpack.conf.js",
    "dev": "webpack --progress --colors --config webpack.conf.js",
    "prod": "NODE_ENV=production webpack -p --config webpack.conf.js"
  }
}
```

So instead of typing those long commands, which are easy to forget or mistype, you can run

```shell
$ npm run watch
$ npm run dev
$ npm run prod
```

# Event
The `events` module provides us the EventEmitter class, which is key to working with events in Node.js.

```js
const EventEmitter = require('events');

const door = new EventEmitter();
```

The event listener has these in-built events:

- `newListener` when a listener is added
- `removeListener` when a listener is removed

Here's a detailed description of the most useful methods:

## [`emitter.addListener()`](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-modules/node-module-events.en.md#emitteraddlistener)

Alias for `emitter.on()`.

## [`emitter.emit()`](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-modules/node-module-events.en.md#emitteremit)

Emits an event. It synchronously calls every event listener in the order they were registered.

```js
door.emit('slam'); // emitting the event "slam"
```

## [`emitter.eventNames()`](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-modules/node-module-events.en.md#emittereventnames)

Return an array of strings that represent the events registered on the current `EventEmitter` object:

```js
door.eventNames();
```

## [`emitter.getMaxListeners()`](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-modules/node-module-events.en.md#emittergetmaxlisteners)

Get the maximum amount of listeners one can add to an `EventEmitter` object, which defaults to 10 but can be increased or lowered by using `setMaxListeners()`

```js
door.getMaxListeners();
```

## [`emitter.listenerCount()`](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-modules/node-module-events.en.md#emitterlistenercount)

Get the count of listeners of the event passed as parameter:

```js
door.listenerCount('open');
```

## [`emitter.listeners()`](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-modules/node-module-events.en.md#emitterlisteners)

Gets an array of listeners of the event passed as parameter:

```js
door.listeners('open');
```

## [`emitter.off()`](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-modules/node-module-events.en.md#emitteroff)

Alias for `emitter.removeListener()` added in Node.js 10

## [`emitter.on()`](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-modules/node-module-events.en.md#emitteron)

Adds a callback function that's called when an event is emitted.

Usage:

```js
door.on('open', () => {
  console.log('Door was opened');
});
```

## [`emitter.once()`](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-modules/node-module-events.en.md#emitteronce)

Adds a callback function that's called when an event is emitted for the first time after registering this. This callback is only going to be called once, never again.

```js
const EventEmitter = require('events');

const ee = new EventEmitter();

ee.once('my-event', () => {
  // call callback function once
});
```

## [`emitter.prependListener()`](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-modules/node-module-events.en.md#emitterprependlistener)

When you add a listener using `on` or `addListener`, it's added last in the queue of listeners, and called last. Using `prependListener` it's added, and called, before other listeners.

## [`emitter.prependOnceListener()`](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-modules/node-module-events.en.md#emitterprependoncelistener)

When you add a listener using `once`, it's added last in the queue of listeners, and called last. Using `prependOnceListener` it's added, and called, before other listeners.

## [`emitter.removeAllListeners()`](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-modules/node-module-events.en.md#emitterremovealllisteners)

Removes all listeners of an `EventEmitter` object listening to a specific event:

```js
door.removeAllListeners('open');
```

## [`emitter.removeListener()`](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-modules/node-module-events.en.md#emitterremovelistener)

Remove a specific listener. You can do this by saving the callback function to a variable, when added, so you can reference it later:

```js
const doSomething = () => {};
door.on('open', doSomething);
door.removeListener('open', doSomething);
```

## [`emitter.setMaxListeners()`](https://github.com/nodejs/nodejs.dev/blob/aa4239e87a5adc992fdb709c20aebb5f6da77f86/content/learn/node-js-modules/node-module-events.en.md#emittersetmaxlisteners)

Sets the maximum amount of listeners one can add to an `EventEmitter` object, which defaults to 10 but can be increased or lowered.

```js
door.setMaxListeners(50);
```
## Event emitter
If you worked with JavaScript in the browser, you know how much of the interaction of the user is handled through events: mouse clicks, keyboard button presses, reacting to mouse movements, and so on.

On the backend side, Node.js offers us the option to build a similar system using the [`events` module](https://nodejs.org/api/events.html).

This module, in particular, offers the `EventEmitter` class, which we'll use to handle our events.

You initialize that using

```js
const EventEmitter = require('events');

const eventEmitter = new EventEmitter();
```

This object exposes, among many others, the `on` and `emit` methods.

- `emit` is used to trigger an event
- `on` is used to add a callback function that's going to be executed when the event is triggered

For example, let's create a `start` event, and as a matter of providing a sample, we react to that by just logging to the console:

```js
eventEmitter.on('start', () => {
  console.log('started');
});
```

When we run

```js
eventEmitter.emit('start');
```

the event handler function is triggered, and we get the console log.

You can pass arguments to the event handler by passing them as additional arguments to `emit()`:

```js
eventEmitter.on('start', number => {
  console.log(`started ${number}`);
});

eventEmitter.emit('start', 23);
```

Multiple arguments:

```js
eventEmitter.on('start', (start, end) => {
  console.log(`started from ${start} to ${end}`);
});

eventEmitter.emit('start', 1, 100);
```

The EventEmitter object also exposes several other methods to interact with events, like

- `once()`: add a one-time listener
- `removeListener()` / `off()`: remove an event listener from an event
- `removeAllListeners()`: remove all listeners for an event

You can read all their details on the events module page at [https://nodejs.org/api/events.html](https://nodejs.org/api/events.html)