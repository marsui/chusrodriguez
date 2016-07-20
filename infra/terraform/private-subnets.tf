resource "aws_subnet" "private" {
  vpc_id = "${aws_vpc.main.id}"
  count = "${length(split(",", var.azs))}"
  cidr_block = "${element(split(",", var.subnet_cidr), count.index)}"
  availability_zone = "${element(split(",", var.azs), count.index)}"

  tags {
    Name = "${var.app-name}-${var.environment}"
    Component = "application"
    Role = "app"
    Environment = "${var.environment}"
  }
}
