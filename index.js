/*
 * Express is the framework we're going to use to handle routing of HTTP Requests.
 * https://expressjs.com/ - a quick check in package.json shows Express 4.x
 */
const express = require('express')
//Create a new instance of express
const app = express()
const path = require('path')
const PORT = process.env.PORT || 5000

app.use('/',  express.static('./web'))

app.listen(process.env.PORT || 5000, () => {
    console.log("Server up and running on port: " + (process.env.PORT || 5000));
});