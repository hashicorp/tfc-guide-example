module "dazz_role" {
  source = "./aws-dazz-role"
  name   = "SecurityTooling_Dazz"
  source_arns = [
    "arn:aws:iam::301712069658:role/assumer-readonly",
    "arn:aws:sts::301712069658:assumed-role/assumer-readonly/Dazz"
  ]
  policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  external_id = "dazzlab-lyhmadt275wt"
  tags = {
    vendor = "dazz"
  }
}

