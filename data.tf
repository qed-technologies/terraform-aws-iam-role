data "aws_iam_policy_document" "trust_policy" {
  source_policy_documents = concat(
    length(var.trusted_identities) > 0 ? [data.aws_iam_policy_document.identity_trust_policy.json]:[],
    length(var.trusted_services) > 0   ? [data.aws_iam_policy_document.service_trust_policy.json]:[],
  )
}

data "aws_iam_policy_document" "identity_trust_policy" {
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

data "aws_iam_policy_document" "service_trust_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = var.trusted_services
    }

    actions = [
      "sts:AssumeRole",
      "sts:TagSession"
    ]
  }
}
