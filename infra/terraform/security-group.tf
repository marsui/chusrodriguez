resource "aws_security_group" "main" {
  name = "${var.app-name}-db-security-group-${var.environment}"
  description = "Incomes public traffic to database"
  vpc_id = "${aws_vpc.main.id}"

  ingress {
    from_port = 0
    to_port = 0
    protocol = -1
    security_groups = ["${aws_security_group.main.id}"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    security_groups = ["${aws_security_group.main.id}"]
  }

  tags {
    Name = "${var.app-name}-${var.environment}"
    Component = "application"
    Role = "app"
    Environment = "${var.environment}"
  }
}
