locals {
  # Multi-step process to ensure path is prefixed and 
  # suffixed with a "/"
  path_first_check = substr(var.path, 0, 1) != "/" ? "/${var.path}" : var.path
  path_final       = substr(local.path_first_check, length(local.path_first_check) - 1, 1) != "/" ? "${local.path_first_check}/" : local.path_first_check
}

resource "aws_iam_role" "this" {
  count = var.create ? 1 : 0

  name        = var.name
  description = var.description
  path        = local.path_final

  assume_role_policy    = data.aws_iam_policy_document.trust_policy.json
  force_detach_policies = var.force_detach_policies
  permissions_boundary  = var.permissions_boundary_arn

  max_session_duration = var.max_session_duration

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags
  )
}

resource "aws_iam_instance_profile" "this" {
  count = var.create && var.is_instance_profile ? 1 : 0

  name = var.name
  path = local.path_final
  role = aws_iam_role.this[0].name
}

# ---------------
#  Trust policy
# ---------------
data "aws_iam_policy_document" "trust_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = var.trusted_identities
    }

    actions = [
      "sts:AssumeRole",
      "sts:TagSession"
    ]
  }
}

# ----------------------------
#  Customer managed policies
# ----------------------------
resource "aws_iam_policy" "customer" {
  count = var.create && length(var.customer_managed_policies) > 0 ? length(var.customer_managed_policies) : 0

  path        = local.path_final
  name        = lookup(var.customer_managed_policies[count.index], "name", null)
  description = lookup(var.customer_managed_policies[count.index], "description", null)
  policy      = lookup(var.customer_managed_policies[count.index], "policy", null)
}

resource "aws_iam_role_policy_attachment" "customer" {
  count = var.create && length(var.customer_managed_policies) > 0 ? length(var.customer_managed_policies) : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.customer[count.index].arn
}

# ----------------------
#  Managed policy ARNs
# ----------------------
resource "aws_iam_role_policy_attachment" "managed_policy" {
  count = var.create && length(var.managed_policy_arns) > 0 ? length(var.managed_policy_arns) : 0

  role       = aws_iam_role.this[0].name
  policy_arn = var.managed_policy_arns[count.index]
}
