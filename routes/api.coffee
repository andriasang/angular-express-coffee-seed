mongoose = require 'mongoose'
Schema = mongoose.Schema
ObjectId = Schema.ObjectId

# PostSchema = new Schema(
#   title:
#     type: String
#     index:
#       unique: true
#   content: String
#   created:
#     type: Date
#     default: Date.now
#   comments : [CommentSchema]
# )

# mongoose.model "Post", PostSchema
# Post = mongoose.model "Post"
# exports.Post = Post

# exports.posts = (req, res) ->
#   Post.find {}, (err, posts) ->
#     res.json posts: posts