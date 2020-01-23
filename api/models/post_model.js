const mongoose = require('mongoose');

const Post = mongoose.Schema({
    title: String,
    media: String,
    content: String,
    type: String,
    authorId: String,
    categoryId: String,
    categoryName: String,
    authorName: String,
    date: {
        type: Date,
        default: Date.now
    },
    isTrending: Boolean,
});

module.exports = mongoose.model('Post', Post);