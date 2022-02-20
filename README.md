# Terraform AWS IAM Role Module

Creates an IAM role with role and trust policy attachments

[![Latest release](https://img.shields.io/github/v/release/qed-technologies/terraform-aws-iam-role)](https://github.com/qed-technologies/terraform-aws-iam-role/releases)

## Purpose

This module is designed to simplify and standardise the creation of AWS IAM Roles and the attachment of IAM Role Policies with Terraform

## Commands

```shell
# runs a plan against the examples/full-implementation directory
make init
make plan 

# Scan using Checkov
make scan

# Generate TF Docs
make docs
```

## Simple Implementation

See `examples/full-implementation`

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~>4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~>4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_instance_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_policy.customer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.customer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.managed_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.trust_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input\_create) | Controls resource creation | `bool` | `false` | no |
| <a name="input_customer_managed_policies"></a> [customer\_managed\_policies](#input\_customer\_managed\_policies) | A list of objects defining role policies to be attached to the IAM role | <pre>list(object({<br>    name        = string<br>    description = string<br>    policy      = string<br>  }))</pre> | `[]` | no |
| <a name="input_description"></a> [description](#input\_description) | A description for the IAM role | `string` | `""` | no |
| <a name="input_force_detach_policies"></a> [force\_detach\_policies](#input\_force\_detach\_policies) | Forces the policies to be detached before destroying the role | `bool` | `false` | no |
| <a name="input_is_instance_profile"></a> [is\_instance\_profile](#input\_is\_instance\_profile) | Determines if the IAM role will be associated to an IAM instance profile | `bool` | `false` | no |
| <a name="input_managed_policy_arns"></a> [managed\_policy\_arns](#input\_managed\_policy\_arns) | A list of Managed Role Policy ARNs | `list(string)` | `[]` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour (3600 seconds) to 12 hours (43200) | `number` | `3600` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the role | `string` | `""` | no |
| <a name="input_path"></a> [path](#input\_path) | Path under which the role resides | `string` | `"/"` | no |
| <a name="input_permissions_boundary_arn"></a> [permissions\_boundary\_arn](#input\_permissions\_boundary\_arn) | The ARN of the policy that is used to set the permissions boundary for the role | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to apply to the IAM role | `map(string)` | `{}` | no |
| <a name="input_trusted_identities"></a> [trusted\_identities](#input\_trusted\_identities) | A list of ARNs this role will trust | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the IAM role |
| <a name="output_instance_profile_arn"></a> [instance\_profile\_arn](#output\_instance\_profile\_arn) | The ARN of the IAM instance profile |
| <a name="output_instance_profile_name"></a> [instance\_profile\_name](#output\_instance\_profile\_name) | The AnameRN of the IAM instance profile |
| <a name="output_name"></a> [name](#output\_name) | The name of the IAM role |
<!-- END_TF_DOCS -->
