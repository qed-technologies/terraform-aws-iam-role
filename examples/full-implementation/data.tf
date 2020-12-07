data "aws_iam_policy_document" "MyAwesomeIAMRolePolicy" {
  count = var.create ? 1 : 0

  statement {
    effect    = "Allow"
    actions   = ["s3:ListBuckets"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "MyPermissionsBoundary" {
  count = var.create ? 1 : 0

  statement {
    effect    = "Allow"
    actions   = ["s3:*"]
    resources = ["*"]
  }
}
