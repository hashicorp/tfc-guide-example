
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "magellanic1"
    key    = "network/terraform.tfstate"
    region = "us-east-1"
  }
}
