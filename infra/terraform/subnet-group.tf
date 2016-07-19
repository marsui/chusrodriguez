resource "aws_db_subnet_group" "default" {
  name = "chusrodriguez-subnet-group-${var.environment}"
  description = "Our main group of subnets"
  subnet_ids = ["${aws_subnet.main.0.id}", "${aws_subnet.main.1.id}"]

  tags {
    Name = "${var.app-name}"
    Component = "database"
    Role = "persistence"
    Environment = "${var.environment}"
  }
}
