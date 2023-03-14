# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  cloud {
    organization = "example-org-d63b9a"

    workspaces {
      name = "github_action"
    }
  }
	required_providers {
		google = {
	    version = "~> 4.51.0"
		}
  }
}
