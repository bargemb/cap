variable "aws_region" {
  description = "Region for the VPC"
  default = "us-west-2"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default = "10.0.0.0/24"
}

variable "public_subnet_az" {
  description = "AZ for the public subnet"
  default = "us-west-2a"
}

variable "private_subnet_1_cidr" {
  description = "CIDR for the private subnet"
  default = "10.0.1.0/24"
}

variable "private_subnet_1_az" {
  description = "AZ for the private subnet 1"
  default = "us-west-2b"
}

variable "private_subnet_2_cidr" {
  description = "CIDR for the private subnet 2"
  default = "10.0.2.0/24"
}

variable "private_subnet_2_az" {
  description = "AZ for the private subnet 2"
  default = "us-west-2c"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "/home/core/.ssh/id_rsa.pub"
}