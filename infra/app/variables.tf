variable "app-name" {
  default = "chusrodriguez"
}

variable "environment" {
	default = "thread"
}

variable "region" {
  default = "eu-west-1"
}

variable "azs" {
  default = "eu-west-1a" // ,eu-west-1b,eu-west-1c
}

variable "bastion_ami" {
  default = ""
}
