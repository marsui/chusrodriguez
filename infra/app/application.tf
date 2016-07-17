resource "aws_elastic_beanstalk_application" "default" {
  name = "${var.app-name}-${var.environment}-application"
  description = "Beanstalk application for ${var.app-name} in ${var.environment}"
}
