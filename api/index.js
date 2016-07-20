var express = require("express");
var app = express();
var bodyParser = require('body-parser')
var http = require('http');
var massive = require("massive");
var connectionString = process.env.CHUSRODRIGUEZ_PGSQL_CONNECTION;
var nodemailer = require('nodemailer');
var sesTransport = require('nodemailer-ses-transport');

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});


var massiveInstance = massive.connectSync({connectionString : connectionString})
app.set('db', massiveInstance);
process.stdout.write('endpoint:', process.env.CHUSRODRIGUEZ_PGSQL_CONNECTION);
process.stdout.write('connected:', !!massiveInstance);

app.use(express.static('dist'));

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




