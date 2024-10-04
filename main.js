const express = require("express");
const app = express();

const PORT = process.env.PORT || 8000;

app.get("/", (req, res) => {
    return res.json({ 'message': "Hello from Node.js Application Created By Shreyas." });
});

app.listen(PORT, () => console.log(`Server has started on PORT: ${PORT}`));
