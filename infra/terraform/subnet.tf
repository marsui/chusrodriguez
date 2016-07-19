resource "aws_subnet" "main" {
  vpc_id = "${aws_vpc.main.id}"
  count = "${length(split(",", var.azs))}"
  cidr_block = "${element(split(",", var.subnet_cidr), count.index)}"
  availability_zone = "${element(split(",", var.azs), count.index)}"

  tags {
    Name = "${var.app-name}"
    Component = "database"
    Role = "persistence"
    Environment = "${var.environment}"
  }
}
