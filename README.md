# Dazz demo environment AWS terraform code

## Overview 

To demonstrate many of the great Dazz features, we have created a live demo environment which connects to a real AWS (and other tools such as Prisma, Shiftleft, Wiz) and get real alerts.

In order to get real alerts, we need to create an environment that demonstrate real scenarios that get alerted by Prisma.

This terraform repostiory builds many AWS resources that are mainly:
    * Part of the environment (For example: ECR to store docker images that has vulnerabilities).
    * Misconfigured cloud resources used to create alerts from Prisma.

## When to change this repostiory

Basically, every time we want to model a new scenario we can easily create new terraform files in the repository and therefore create a new resource.

This is a maintained code, therefore each change must be reviewed and be in a pull request. Feel free to set Amit / Guy / Eyal as reviewers for now!

## How to be careful

This terraform repository contains resources with important data for our demo, such as our container registry. Therefore be aware not to `terraform destroy` by accident.

## Deployment

This repository connected to Dazz Terraform Cloud tenant and get "terraform apply"-ed on every change to the main branch.

In order to get access to app.terraform.io, please consult with the Dazz engineering team.


## What will this do?

When you set up a Workspace on Terraform Cloud, you can link to this repository. Terraform Cloud can then run `terraform plan` and `terraform apply` automatically when changes are pushed. For more information on how Terraform Cloud interacts with Version Control Systems, see [our VCS documentation](https://www.terraform.io/docs/cloud/run/ui.html).

## What are the prerequisites?

You must have an AWS account and provide your AWS Access Key ID and AWS Secret Access Key to Terraform Cloud. Terraform Cloud encrypts and stores variables using [Vault](https://www.vaultproject.io/). For more information on how to store variables in Terraform Cloud, see [our variable documentation](https://www.terraform.io/docs/cloud/workspaces/variables.html).

The values for `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` should be saved as environment variables on your workspace.
