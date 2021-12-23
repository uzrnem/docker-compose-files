'use strict';

const express = require('express');
const { DATABASE, USER, PASSWORD } = require('./env');

// Constants
const PORT = 8080;

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Hello World');
});

app.listen(PORT, function () {
  console.log('app listening on port ${PORT}!')
})

console.log('DATABASE: ', DATABASE);
console.log('USER: ', USER);
console.log('PASSWORD: ', PASSWORD)
console.log(`Running on http://localhost:${PORT}`);
