# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }

#    random = {
#      source  = "hashicorp/random"
#      version = "3.0.0"
#    }
  }

  required_version = ">= 1.5.6"
}

