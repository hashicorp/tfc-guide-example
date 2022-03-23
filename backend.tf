terraform {
  backend "s3" {
      bucket = "magellanic1"
      key    = "terraform.tfstate"
      region = "us-east-1"
    }
}
