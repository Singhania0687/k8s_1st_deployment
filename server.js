require('dotenv').config();
const express = require('express');
const app = express();
const PORT = process.env.PORT ;

app.get('/', (req, res) => {
  res.send('Hello, Kubernetes!');
});

app.listen(PORT,"0.0.0.0", () => {
  console.log(`Server running on port ${PORT}`);
});
