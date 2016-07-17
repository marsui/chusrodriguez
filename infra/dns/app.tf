resource "aws_route53_record" "default" {
  zone_id = "${var.zone_id}"
  name = "chusrodriguez.es"
  type = "CNAME"
  ttl = "0"
  records = ["${var.beanstalk_cname}"]
}

resource "aws_route53_record" "www" {
  zone_id = "${var.zone_id}"
  name = "www"
  type = "CNAME"
  ttl = "0"
  records = ["${aws_route53_record.default.name}"]
}
