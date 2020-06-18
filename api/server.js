// server.js
const jsonServer = require('json-server')
const server = jsonServer.create()
const router = jsonServer.router('db.json')
const middlewares = jsonServer.defaults()

const low = require('lowdb')
const FileSync = require('lowdb/adapters/FileSync')
const adapter = new FileSync('db.json')
const db = low(adapter)

server.use(middlewares)

server.use(jsonServer.bodyParser)
router.render = (req, res) => {
  console.log(req.path)
    if ((req.method === 'POST') && (req.path === '/authenticate')) {
      var customer = db.get('customers').find({
        email: req.body.email,
        password: req.body.password
      }).value()
      if (customer) {
        res.status(200).jsonp(
          db.get('customers')
          .find({
            email: req.body.email,
            password: req.body.password
          })
          .value()
        )
      } else {
        res.status(404).jsonp(res.locals.data)
      }
    } else {
      res.jsonp(res.locals.data)
    }
}

server.use(router)
server.listen(3000, () => {
  console.log('JSON Server is running')
})