var AWS = require('aws-sdk');

var environment = process.env.ENVIRONMENT;
var region = process.env.REGION;
var sha = process.env.GIT_SHA;

var accessKey = process.env.AWS_ACCESS_KEY_ID;
var secretKey = process.env.AWS_SECRET_ACCESS_KEY;

AWS.config.update({
  accessKeyId: accessKey,
  secretAccessKey: secretKey,
  region: region
});

var elasticbeanstalk = new AWS.ElasticBeanstalk();

elasticbeanstalk.describeEnvironments({
  EnvironmentNames: [environment + '-' + sha]
}, function(err, data) {
  if (err) {
    console.log(err);
    process.exit(1);
  }

  var exists = !!data.Environments.length;
  if(!exists) {
   process.stdout.write('none');
   return;
  }

  process.stdout.write(data.Environments[0].CNAME);

});
