# Release Notes

## v2.1.3 - 2020-12-26

### Bug Fixes

- Add missing `path` attribute to `aws_iam_instance_profile` resource

## v2.1.2 - 2020-12-26

### Bug Fixes

- Add correctly formatted `local.path` to customer managed policies

## v2.1.1 - 2020-12-24

### Enhancements

- Support Terraform v0.14.x

## v2.1.0 - 2020-12-19

### Bug Fixes

- Handle situation when client doesn't supply a correctly formatted `path`

## v2.0.0 - 2020-12-19

### Breaking Changes

- Renamed `amazon_managed_policy_arns` to `managed_policy_arns` to better indicate the values that can be accepted

## v1.2.0 - 2020-12-09

### Bug Fixes

- Removed `resources` attribute from trust policy

## v1.1.0 - 2020-12-07

### New Features

- Introduced `trusted_identities` variable so client can submit list of ARNs to trust rather than whole policy document

## v1.0.0 - 2020-11-20

### New Features

- Inital release
