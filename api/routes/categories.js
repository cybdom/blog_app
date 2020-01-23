const express = require('express');
const router = express.Router();
const Category = require('../models/category_model');

router.post('/new', (req, res) => {
    Category.create(req.body).then((doc) => {
        console.log(doc.id);
        res.send("Category Created: " + doc.id);
    }).catch((err) => {
        console.log(err);
        res.status(400).send("Error creating post");
    })
});

router.get('/', (req, res) => {
    Category.find().then((doc) => {
        res.send(doc);
    }).catch((err) => {
        res.status(400).send(err);
    })
});

router.post('/id', (req, res) => {
    Category.findById(req.body.id, function (err, doc) {
        if (err) return res.status(400).send("Can\'t find " + req.body.id);
        res.send(doc);
    });
})
module.exports = router;