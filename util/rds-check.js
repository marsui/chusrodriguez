var AWS = require('aws-sdk');

var environment = process.env.ENVIRONMENT;
var region = process.env.AWS_REGION;

var accessKey = process.env.AWS_ACCESS_KEY_ID;
var secretKey = process.env.AWS_SECRET_ACCESS_KEY;

AWS.config.update({
  accessKeyId: accessKey,
  secretAccessKey: secretKey,
  region: region
});

var rds = new AWS.RDS();

rds.describeDBInstances({}, function(err, data) {
  if (err) {
    console.log(err);
    process.exit(1);
  }

  var exists = !err && data && data.DBInstances.filter(function(item) {
    return item.DBInstanceIdentifier === 'chusrodriguez-' + environment + '-db'
  }).length > 0 ? 'true' : 'false';

  process.stdout.write(exists);

});
