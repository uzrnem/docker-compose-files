'use strict';

const express = require('express');

// Constants
const PORT = 9050;

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Hello World');
});

app.listen(PORT, function () {
  console.log('app listening on port ${PORT}!')
})
