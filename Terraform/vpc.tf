provider "aws" {
    region = "${var.aws_region}"
}

resource "aws_vpc" "my-vpc" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags = {
        Terraform = "true"
    } 
}

# Define the public subnet
resource "aws_subnet" "public-subnet" {
    vpc_id = "${aws_vpc.my-vpc.id}"
    cidr_block = "${var.public_subnet_cidr}"
    availability_zone = "${var.public_subnet_az}"
    tags {
        Name = "Public Subnet"
    }
}

# Define the private subnet
resource "aws_subnet" "private-subnet-1" {
    vpc_id = "${aws_vpc.my-vpc.id}"
    cidr_block = "${var.private_subnet_1_cidr}"
    availability_zone = "${var.private_subnet_1_az}"
    tags {
        Name = "Private Subnet"
    }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id = "${aws_vpc.my-vpc.id}"
  cidr_block = "${var.private_subnet_2_cidr}"
  availability_zone = "${var.private_subnet_2_az}"
  tags {
    Name = "Private Subnet"
  }
}