# Terraform Cloud Getting Started Guide Example

This is an example Terraform configuration intended for use with the [Terraform Cloud Getting Started Guide](https://learn.hashicorp.com/terraform/cloud-gettingstarted/tfc_overview).

# What will this do?

This is a simple Terraform configuration that will create an empty DynamoDB table in your AWS account.

When you set up a Workspace on Terraform Cloud, you can link to this repository. Terraform Cloud can then run `terraform plan` and `terraform apply` automatically when changes are pushed to this repository. For more information on how Terraform Cloud interacts with Version Control Systems, see [our VCS documentation](https://www.terraform.io/docs/cloud/run/ui.html).

# What are the prerequisites?

You must have an AWS account and provide your AWS Access Key ID and AWS Secret Access Key to Terraform Cloud. Terraform Cloud encrypts all variables using [Vault](https://www.vaultproject.io/). For more information on how to store variables in Terraform Cloud, see [our variable documentation](https://www.terraform.io/docs/cloud/workspaces/variables.html).
