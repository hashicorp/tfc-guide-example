provider "aws" {
  region = var.region
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
esource "tfe_variable" "admin_variable_set_variables" {
  for_each = {
    # github provider
    "GITHUB_APP_ID" : "1111",
    "GITHUB_APP_INSTALLATION_ID" : "2222"
    "GITHUB_OWNER" : "test_tfe_variable"
    # google / google-beta provider
    
    # tfe provider
    "TFE_ORGANIZATION" : "example-org-e4df2b"
    # other
    "TF_VAR_tfc_organisation_name" : "example-org-e4df2b",
  }
