resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "${var.app-name}"
    Component = "database"
    Role = "persistence"
    Environment = "${var.environment}"
  }
}
