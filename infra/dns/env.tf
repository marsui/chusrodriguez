resource "aws_route53_record" "local" {
  zone_id = "${var.zone_id}"
  name = "chusrodriguez-${var.environment}"
  type = "CNAME"
  ttl = "1"
  records = ["${var.application_endpoint}"]
}
