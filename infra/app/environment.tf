resource "aws_elastic_beanstalk_environment" "default" {
  name = "${var.app-name}-${var.environment}-environment"
  application = "${aws_elastic_beanstalk_application.default.name}"
  solution_stack_name = "64bit Amazon Linux 2016.03 v2.1.3 running Docker 1.11.1"
}
