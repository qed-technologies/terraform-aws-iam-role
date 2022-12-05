module "iam_role" {
  source = "../../"

  create      = var.create
  name        = "MyAwesomeIAMRole"
  description = "IAM Role to do something"

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
}
