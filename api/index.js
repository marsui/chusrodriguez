var express = require("express");
var app = express();
var bodyParser = require('body-parser')
var http = require('http');
var massive = require("massive");
var connectionString = process.ENV.CHUSRODRIGUEZ_PGSQL_CONNECTION;
var nodemailer = require('nodemailer');
var sesTransport = require('nodemailer-ses-transport');

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});


// connect to Massive and get the db instance. You can safely use the
// convenience sync method here because its on app load
// you can also use loadSync - it's an alias
var massiveInstance = massive.connectSync({connectionString : connectionString})

// Set a reference to the massive instance on Express' app:
app.set('db', massiveInstance);
app.use(bodyParser.json());
http.createServer(app).listen(3000);

app.get('/', function (req, res) {
	res.send('It works!');
});

require('./collections')(app);
require('./photos')(app);
require('./dresses')(app);
require('./accessories')(app);
require('./contact')(app);
require('./s3')(app);




