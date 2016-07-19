//resource "aws_route53_record" "default" {
//  zone_id = "${var.zone_id}"
//  name = "chusrodriguez.es"
//  type = "CNAME"
//  ttl = "1"
//  records = ["${aws_elastic_beanstalk_application.default.}"]
//}
//
//resource "aws_route53_record" "www" {
//  zone_id = "${var.zone_id}"
//  name = "www"
//  type = "CNAME"
//  ttl = "1"
//  records = ["${aws_route53_record.default.name}"]
//}

resource "aws_route53_record" "db" {
  zone_id = "${var.zone_id}"
  name = "${var.environment}-db"
  type = "CNAME"
  ttl = "1"
  records = ["${aws_db_instance.default.endpoint}"]
}
