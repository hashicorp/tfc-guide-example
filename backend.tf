
terraform {
  backend "s3" {
      bucket = "magellanic1"
      key    = "network/terraform.tfstate"
      region = "us-east-1"
    }
}
