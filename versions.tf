terraform {
  
  cloud {
    organization = "ACME_Demo"

    workspaces {
      name = "ACME_Demo_Example"
    }
  }
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.28.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.0.0"
    }
  }

  required_version = ">= 0.14.0"
}
