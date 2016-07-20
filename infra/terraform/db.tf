module "database" {
source = "git::https://github.com/marsui/chusrodriguez//infra/db"

  app-name = "${var.app-name}"
  aws_access_key = "${var.aws_access_key}"
  aws_region = "${var.aws_region}"
  aws_secret_key = "${var.aws_secret_key}"
  azs = "${var.azs}"
  cidr_block = "${var.db_cidr_block}"
  db_name = "${var.db_name}"
  db_name = "${var.db_name}"
  db_passwor = "${var.db_password}"
  db_user = "${var.db_user}"
  environment = "${var.environment}"
  peer_with = "${aws_vpc.main.id}"
  subnet_cidr = "${var.db_subnet_cidr}"
  zone_id = "${var.zone_id}"
}
