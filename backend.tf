
terraform {
  backend "s3" {
      bucket = "magellanic2"
      key    = "terraform.tfstate"
      region = "us-east-1"
    }
}
