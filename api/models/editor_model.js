const mongoose = require('mongoose');

const Editor = mongoose.Schema({
    fullname: {
        type: String,
        required: true
    },
    image: {
        type: String,
        required: true
    },
    type: {
        type: String,
        required: true
    },
    trending_count: {
        type: Number,
        required: true
    },
    bookmarked_count: {
        type: Number,
        required: true
    },
    favorite_count: {
        type: Number,
        required: true
    },
    awards_count: {
        type: Number,
        required: true
    },
    articles: [{
        articleId: String,
        categoryId: String,
    }]
});

module.exports = mongoose.model('Editor', Editor);