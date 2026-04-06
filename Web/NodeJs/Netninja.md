module.exports
require

modules:
- os
- fs : readstream,writestream,pipe,duplexStream
#### http
```js
const http = require('http');
const
server = http.createServer((req, res) = {
	console.log('request made');
	});
server. listen(3000, 'localhost', () => {
console.log('listening for requests on port 3000');
});
```

#### Status Code
100 Range - informational responses
200 Range - success codes
300 Range - codes for redirects
400 Range - user or client error codes
500 Range - server error codes