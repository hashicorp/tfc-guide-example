resource "aws_iam_role" "this" {
  name               = var.name
  assume_role_policy = data.aws_iam_policy_document.this.json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each   = toset(var.policy_arns)
  role       = aws_iam_role.this.name
  policy_arn = each.value
}

data "aws_iam_policy_document" "this" {
  statement {
    sid     = "AllowAssumeRoleFromDazzAccount"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = var.source_arns
    }

    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = [var.external_id]
    }
  }
}
