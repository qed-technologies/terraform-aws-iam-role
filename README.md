# Terraform AWS IAM Role Module

Creates an IAM role with role and trust policy attachments

## Purpose

This module is designed to simplify and standardise the creation of AWS IAM Roles and the attachment of IAM Role Policies with Terraform

## Commands

```shell
# runs a plan against the examples/full-implementation directory
make plan 

# Scan using Checkov
make scan

# Generate TF Docs
make docs
```

## Simple Implementation

See `examples/full-implementation`

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.7, < 0.14 |
| aws | >= 2.68, < 4.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.68, < 4.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| amazon\_managed\_policy\_arns | A list of AWS Managed Role Policy ARNs | `list(string)` | `[]` | no |
| create | Controls resource creation | `bool` | `false` | no |
| customer\_managed\_policies | A list of objects defining role policies to be attached to the IAM role | <pre>list(object({<br>    name        = string<br>    description = string<br>    policy      = string<br>  }))</pre> | `[]` | no |
| description | A description for the IAM role | `string` | `""` | no |
| force\_detach\_policies | Forces the policies to be detached before destroying the role | `bool` | `false` | no |
| is\_instance\_profile | Determines if the IAM role will be associated to an IAM instance profile | `bool` | `false` | no |
| max\_session\_duration | The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour (3600 seconds) to 12 hours (43200) | `number` | `3600` | no |
| name | The name of the role | `string` | `""` | no |
| path | Path under which the role resides | `string` | `"/"` | no |
| permissions\_boundary\_arn | The ARN of the policy that is used to set the permissions boundary for the role | `string` | `""` | no |
| tags | A map of tags to apply to the IAM role | `map(string)` | `{}` | no |
| trusted\_identities | A list of ARNs this role will trust | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the IAM role |
| instance\_profile\_arn | The ARN of the IAM instance profile |
| instance\_profile\_name | The AnameRN of the IAM instance profile |
| name | The name of the IAM role |
