const express = require('express');
const app = express();
const mongoose = require('mongoose');
const bodyParser = require('body-parser');

const categoriesRoutes = require('./routes/categories');
const editorsRoutes = require('./routes/editors');
const postsRoutes = require('./routes/posts');

require('dotenv').config();
app.use(bodyParser.json());

app.use('/posts', postsRoutes);
app.use('/cat', categoriesRoutes);
app.use('/editors', editorsRoutes);

mongoose.connect(
    process.env.DB_CONNECT, { useNewUrlParser: true, useUnifiedTopology: true }, () => {
        console.log("Database connected.")
    });


app.listen(80, () => {
    console.log("Server Started");
});