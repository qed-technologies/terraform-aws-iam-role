data "aws_iam_policy_document" "MyAwesomeIAMRolePolicy" {
  count = var.create ? 1 : 0

  #checkov:skip=CKV_AWS_108:This is a demo policy
  #checkov:skip=CKV_AWS_109:This is a demo policy
  #checkov:skip=CKV_AWS_111:This is a demo policy
  statement {
    effect    = "Allow"
    actions   = ["s3:ListBuckets"]
    resources = ["*"]
  }
}
