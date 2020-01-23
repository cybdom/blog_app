const express = require('express');
const router = express.Router();
const Posts = require('../models/post_model');

router.post('/new', (req, res) => {
    Posts.create(req.body).then((doc) => {
        res.send("Post created: " + doc.id);
    }).catch((err) => {
        res.status(400).send(err);
    })
});

router.get('/', (req, res) => {
    Posts.find().then((doc) => {
        res.send(doc);
    }).catch((err) => {
        res.status(400).send(err);
    });
});

router.post('/user', (req, res) => {
    Posts.find({ 'authorId': req.body.id }, function (err, doc) {
        if (err){
            res.send(err);
        }else{
            res.send(doc);
        }
    });
});

router.post('/id', (req, res) => {
    Posts.findById(req.body.id).then((doc) => {
        res.send(doc);
    }).catch((err) => {
        res.status(400).send(err);
    });
});
module.exports = router;