resource "aws_route53_record" "default" {
  zone_id = "${var.zone_id}"
  name = "tallerchusrodriguez.com"
  type = "A"
  ttl = "1"

  alias {
    name = "${aws_route53_record.local.name}"
    zone_id = "${var.zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "www" {
  zone_id = "${var.zone_id}"
  name = "www"
  type = "CNAME"
  ttl = "1"
  records = ["${aws_route53_record.default.name}"]
}
