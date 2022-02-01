terraform {
  required_providers {
    fakewebservices = "~> 0.1"

    random = {
      source  = "hashicorp/random"
      version = "3.0.0"
    }
  }

  required_version = ">= 0.14.0"
}
