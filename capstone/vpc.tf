resource "aws_vpc" "capstone-vpc" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags {
    Name = "capstone-vpc"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.capstone-vpc.id}"
}

resource "aws_subnet" "us-east-1-public-1" {
  vpc_id = "${aws_vpc.capstone-vpc.id}"

  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "${var.availability_zones[0]}"

  tags {
    Name = "Public Subnet"
  }
}

resource "aws_subnet" "us-east-1-public-2" {
  vpc_id = "${aws_vpc.capstone-vpc.id}"

  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "${var.availability_zones[1]}"

  tags {
    Name = "Public Subnet"
  }
}

resource "aws_subnet" "us-east-1-public-3" {
  vpc_id = "${aws_vpc.capstone-vpc.id}"

  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "${var.availability_zones[2]}"

  tags {
    Name = "Public Subnet"
  }
}
