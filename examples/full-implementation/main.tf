module "iam_role" {
  source = "../../"

  create = var.create

  is_instance_profile   = true
  name                  = "MyAwesomeIAMRole"
  description           = "IAM Role to do something"
  force_detach_policies = true
  max_session_duration  = 43200

  permissions_boundary_arn = concat(aws_iam_policy.MyPermissionsBoundary.*.arn, [""])[0]
  trusted_identities = [
    "arn:aws:iam::123456789012:root"
  ]

  customer_managed_policies = [
    {
      name        = "MyAwesomeIAMRolePolicy"
      description = "A customer managed IAM Policy document"
      policy      = concat(data.aws_iam_policy_document.MyAwesomeIAMRolePolicy.*.json, [""])[0]
    }
  ]

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
    "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
  ]
}

resource "aws_iam_policy" "MyPermissionsBoundary" {
  count       = var.create ? 1 : 0
  name        = "MyPermissionsBoundary"
  path        = "/"
  description = "My permissions boundary"
  policy      = concat(data.aws_iam_policy_document.MyPermissionsBoundary.*.json, [""])[0]
}
