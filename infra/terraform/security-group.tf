resource "aws_security_group" "allow_all" {
  name = "${var.app-name}-db-security-group-${var.environment}"
  description = "Incomes public traffic to database"
  vpc_id = "${aws_vpc.main.id}"

  ingress {
    from_port = 5432
    to_port = 5432
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.app-name}"
    Component = "database"
    Role = "persistence"
    Environment = "${var.environment}"
  }
}
