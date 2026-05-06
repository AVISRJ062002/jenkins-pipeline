const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send("Service 2 running");
});

app.get('/health', (req, res) => {
  res.json({ status: 'ok' });
});

app.listen(3000, () => {
  console.log("Service 2 sarthak started");
});
