const express = require("express");
const router = require("./routers");
const path = require("path");
require("dotenv/config");
const app = express();

app.get(function (req, res) {
  res.sendFile(path.join(__dirname, "index.html"));
});

app.get(function (req, res) {
  res.sendFile("login2.html");
});

app.get(function (req, res) {
  res.sendFile(path.join(__dirname, "sevkiyat.html"));
});

app.get(function (req, res) {
  res.sendFile(path.join(__dirname, ""));
});

app.get(function (req, res) {
  res.sendFile(path.join(__dirname, "performans.html"));
});

app.get(function (req, res) {
  res.sendFile(path.join(__dirname, "cevreci.html"));
});

app.use(express.json({ limit: "50mb", extended: true, parameterLimit: 50000 }));
app.use("/api", router);
app.listen(5500, function () {
  console.log("listening on port 5500");
});
