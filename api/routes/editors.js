const express = require('express');
const router = express.Router();
const Editors = require('../models/editor_model');

router.get('/', (req, res) => {
    Editors.find().then((doc) => {
        res.send(doc.id);
    }).catch((err) => {
        res.status(400).send(err);
    });
});

router.post('/id', (req, res) => {
    Editors.findById(req.body.id).then((doc) => {
        console.log("Specific Author");
        res.send(doc);
    }).catch((err) => {
        res.status(400).send(err);
    });
});

router.post('/new', (req, res) => {
    Editors.create(req.body).then((doc) => {
        console.log(doc.id);
        res.send("Editor created: " + doc.id);
    }).catch((err) => {
        res.status(400).send(err);
    });
});
module.exports = router;