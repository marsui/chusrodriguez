resource "aws_db_instance" "default" {
  identifier = "${var.app-name}-${var.environment}-db"
  allocated_storage    = 10
  engine               = "postgres"
  engine_version       = "9.5.2"
  instance_class       = "db.t2.micro"
  license_model        = "postgresql-license"
  name                 = "${var.db_name}"
  username             = "${var.db_user}"
  password             = "${var.db_password}"
  db_subnet_group_name = "${aws_db_subnet_group.default.name}"
  storage_type         = "standard"
  multi_az = false
  publicly_accessible = true

  vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
}
