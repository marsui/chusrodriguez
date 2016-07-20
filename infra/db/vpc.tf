resource "aws_vpc" "main" {
  cidr_block = "${var.cidr_block}"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags {
    Name = "${var.app-name}-${var.environment}"
    Component = "database"
    Role = "persistence"
    Environment = "${var.environment}"
  }
}

resource "aws_iam_user" "peer_owner" {
  name = "${var.app-name}_peer_owner"
  path = "/system/"
}

resource "aws_vpc_peering_connection" "peer" {
  peer_owner_id = "${aws_iam_user.peer_owner.id}"
  peer_vpc_id = "${var.peer_with}"
  vpc_id = "${aws_vpc.main.id}"
}
