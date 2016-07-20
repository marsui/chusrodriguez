resource "aws_vpc" "main" {
  cidr_block = "${var.cidr_block}"
  enable_dns_hostnames = true
  enable_dns_support = true

  default_security_group_id = "${aws_security_group.main.id}"

  tags {
    Name = "${var.app-name}-${var.environment}"
    Component = "application"
    Role = "app"
    Environment = "${var.environment}"
  }
}
