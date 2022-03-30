variable "name" {
  type        = string
  description = "The role's name."
}

variable "source_arns" {
  type        = list(string)
  description = "ARNs of the entities that can assume the role."
}

variable "policy_arns" {
  type        = list(string)
  description = "List of policy ARNs that will be attached to the role."
}

variable "external_id" {
  type        = string
  description = "An external ID chosen by Dazz. See: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-user_externalid.html."
}

variable "tags" {
  type        = map(any)
  description = "The role's tags."
  default     = {}
}
