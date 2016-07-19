resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "${var.app-name}"
    Component = "database"
    Role = "persistence"
    Environment = "${var.environment}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "public-routetable-${var.app-name}-${var.environment}"
    Component = "${var.app-name}"
    EnvironmentIdentifier = "${var.environment}"
    Tier = "public"
  }
}

resource "aws_route" "public_internet" {
  route_table_id = "${aws_route_table.public.id}"
  gateway_id = "${aws_internet_gateway.main.id}"
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "public" {
  count = "${length(split(",", var.azs))}"
  subnet_id = "${element(aws_subnet.main.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}
