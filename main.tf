provider "aws" {
  region = var.aws_region
}

provider "random" {}

resource "random_pet" "table_name" {}

}
