/** @format */

// app.js
const express = require("express");
const os = require("os");

const app = express();
const port = 3000;

// Root endpoint
app.get("/", (req, res) => {
  res.send("Welcome to the Caves, visit /api/v1/pod to get a pod-home-id");
});

// /api/v1/pod endpoint
app.get("/api/v1/pod", (req, res) => {
  const podId = process.env.HOSTNAME || os.hostname();

  const response = {
    location: "pod",
    "pod-id": podId,
  };

  res.json(response);
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});