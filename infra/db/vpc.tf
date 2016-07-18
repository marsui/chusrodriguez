resource "aws_vpc" "main" {
  cidr_block = "10.250.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags {
    Name = "${var.app-name}-${var.environment}"
    Component = "database"
    Role = "persistence"
    Environment = "${var.environment}"
  }
}
