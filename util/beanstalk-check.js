var AWS = require('aws-sdk');

var environment = process.env.ENVIRONMENT;
var region = process.env.REGION;

var accessKey = process.env.AWS_ACCESS_KEY_ID;
var secretKey = process.env.AWS_SECRET_ACCESS_KEY;

AWS.config.update({
  accessKeyId: accessKey,
  secretAccessKey: secretKey,
  region: region
});

var elasticbeanstalk = new AWS.ElasticBeanstalk();

elasticbeanstalk.describeApplications({
  ApplicationNames: ['chusrodriguez-' + environment + '-application']
}, function(err, data) {
  if (err) {
    console.error(err, err.stack); // an error occurred
    process.stdout.write('false');
    return;
  }

  var exists = !!data.Applications.length + '';

  process.stdout.write(exists);

});
