# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "AWS region"
  default     = "us-west-1"
}

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

variable "instance_name" {
  description = "EC2 instance name"
  default     = "Provisioned by Terraform"
}

// DO NOT put your AWS credentials in code 
//DO NOT run AWS CLI locally
//DO NOT RUN TERRAFORM LOCALLY
//Because credentials are stored in plain text locally
//And anyone with access to your comnmputer can have your level of access
//to company resources.

variable "AWS_ACCESS_KEY_ID" {
  description = "Temp AWS creds"
  default     = ""
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "Temp AWS creds"
  default     = ""
}

//Keep the values in code stored blank
