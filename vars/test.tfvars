# Set Terraform Working Directory to:
#   topology/
# Define in workspace variables:
#   TF_CLI_ARGS_plan    = -var-file=../vars/test.tfvars
#   TF_CLI_ARGS_apply   = -var-file=../vars/test.tfvars
#   TF_CLI_ARGS_refresh = -var-file=../vars/test.tfvars

region = "us-east-2"
instance_name = "my-instance-pr1"
