
terraform {
  backend "s3" {
      bucket = "magellanic2"
      key    = "network/terraform.tfstate"
      region = "us-east-1"
    }
}
