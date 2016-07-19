variable "db_name" {
  default = "chusrodriguez"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "zone_id" {
  default = ""
}

variable "aws_region" {
  default = "eu-west-1"
}

variable "azs" {
  default = "eu-west-1a,eu-west-1b" // ,eu-west-1b,eu-west-1c
}

variable "subnet_cidr" {
  default = "10.250.0.0/24,10.250.1.0/24"
}

variable "app-name" {
  default = "chusrodriguez"
}

variable "environment" {
  default = "thread"
}

variable "db_name" {
  default = "chusrodriguez"
}

variable "db_user" {
  default = ""
}
variable "db_password"{
  default = ""
}

variable "subnet_cidr" {
  default = "10.250.0.0/24,10.250.1.0/24"
}

variable "app-name" {
  default = "chusrodriguez"
}

variable "environment" {
  default = "thread"
}
