provider "aws" {
  version = "2.33.0"

  region = var.aws_region
}

resource "aws_instance" "new_ec2" {

ami = "ami-03caa3f860895f82e"
type = "t3.micro"

}

resource "aws_dynamodb_table" "tfc_example_table" {
  name = var.db_table_name

  read_capacity  = var.db_read_capacity
  write_capacity = var.db_write_capacity
  hash_key       = "UUID"

  attribute {
    name = "UUID"
    type = "S"
  }

  tags = {
    user_name = var.tag_user_name
  }
}
