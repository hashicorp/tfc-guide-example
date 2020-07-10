provider "aws" {
  version = "2.33.0"

  region = var.aws_region
}

resource "aws_dynamodb_table" "tfc_example_table" {
  name = var.db_table_name

  read_capacity  = var.db_read_capacity
  write_capacity = var.db_write_capacity
  hash_key       = "UUID"
  range_key      = "UserName1"

  attribute {
    name = "UUID"
    type = "S"
  }

  attribute {
    name = "UserName1"
    type = "S"
  }

  tags = {
    user_name = var.tag_user_name
  }
}
