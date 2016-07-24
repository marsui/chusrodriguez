var aws = require('aws-sdk');
var multer = require('multer');
var multerS3 = require('multer-s3');
var mime = require('mime');

var s3 = new aws.S3({
    signatureVersion: 'v4',
    region: 'eu-west-1',
    accessKeyId: process.env.AWS_ACCESS_KEY_ID_S3,
    secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY_S3,
    params: {
      bucket: process.env.IMAGES_BUCKET
    }
});

var host = 'http://chusrodriguez-image-storage.s3-website-eu-west-1.amazonaws.com/';
var lastFile = null;

var upload = multer({
  storage: multerS3({
    s3: s3,
    bucket: process.env.IMAGES_BUCKET,
    acl: 'public-read',
    contentType: function (req, file, cb) {
      cb(null, file.mimetype);
    },
    key: function (req, file, cb) {
      lastFile = 'images/' + Date.now().toString() + '.' + mime.extension(file.mimetype);
      cb(null, lastFile);
    },
    metadata: function (req, file, cb) {
      cb(null, {fieldName: file.fieldname});
    }
  })
});

module.exports = function(app) {

  app.post('/admin/photos/upload', upload.single('file[0]'), function (req, res, next) {
    res.send(host + lastFile);
  });
};
