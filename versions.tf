terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "daimoniac"

    workspaces {
      name = "test"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.28.0"
      profile = "terraformGM"
      region  = "us-east-1"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.0.0"
    }
  }

  required_version = ">= 0.14.0"
}
