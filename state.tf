data "terraform_remote_state" "vpc" {
  backend = "remote"
  config = {
    organization = "example-org-adedf3"
    workspaces = {
      name = "ws-7eGGZtsFCzHxcFgV"
    }
  }
}
