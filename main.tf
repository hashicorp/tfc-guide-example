provider "aws" {
  access_key = "AKIATCINKSEDYRG5CCOB"
  secret_key = "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"
  region     = "${var.region}"
}

## Create VPC ##
resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_cidr}"
  instance_tenancy ="default"
  
  tags = {
    Name = "main"
    Location = "Mumbai"
  }
}

resource "aws_subnet" "subnets" {
  count = "${length(data.aws_availability_zones.azs.names)}"
  availability_zones = "${element(data.aws_availability_zones.azs.names,count.index)}"
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${element(var.subnet_cidr,count.index)}"

  tags = {
    Name = "subnet-${count.index+1}"
  }
}
