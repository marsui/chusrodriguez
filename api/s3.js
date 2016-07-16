var aws = require('aws-sdk'); 
var s3 = new aws.S3({
    signatureVersion: 'v4',
    region: 'eu-west-1',
    accessKeyId: 'AKIAI32Z2Y63U62NVCOA',
    secretAccessKey: '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'
});

module.exports = function(app) {

	app.post('/admin/photos/upload', function(req, res) {
		var params = {
			Bucket: 'chusrodriguez-images', 
			Key: 'image.png', 
			Expires: 60, 
			ContentMD5: 'false',
			ACL: 'public-read',
			Body: req.body
		};

		s3.putObject(params, function(err, data) {
			if (err) {
		  		res.status(503).send({ error: err, body: req.body });
		  	}
		  	else {
		  		res.status(200).send({ status: 'ok' });
		  	}
		});



	});
};