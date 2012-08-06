express = require 'express'
http = require 'http'
path = require 'path'
less = require 'less'

assets = require 'connect-assets'

routes = require './routes'
api = require './routes/api'
mongoose = require 'mongoose'

db = null
app = express()

app.use assets()

app.configure ->
  app.set 'port', process.env.PORT or 3000
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.use express.favicon()
  app.use express.logger('dev')
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser('your secure key')
  app.use express.session()
  app.use app.router
  app.use express.static(path.join(__dirname, 'public'))


app.configure "development", ->
  app.use express.errorHandler(
    dumpExceptions: true
    showStack: true
  )
  db = mongoose.connect 'mongodb://<user>:<password>@server-url:port/app-name'

app.configure "production", ->
  app.use express.errorHandler()
  db = mongoose.connect 'mongodb://<user>:<password>@server-url:port/app-name'



 # Routes
app.get '/', routes.index
app.get '/partials/:name', routes.partials

# JSON API
# app.get '/api/posts', api.posts

# redirect all others to the index (HTML5 history)
app.get '*',  (req, res) ->
  res.render "index"

http.createServer(app).listen app.get('port'), ->
  console.log 'Express server listening on port ' + app.get('port')
