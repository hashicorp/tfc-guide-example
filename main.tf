provider "aws" {
  version = "2.33.0"

  region = var.aws_region
}

provider "random" {
  version = "2.2"
}

resource "random_pet" "table_name" {}

resource "aws_instance" "basic" {
  ami           = "ami-0ee1a20d6b0c6a347"
  instance_type = "t3.nano"
}

}
