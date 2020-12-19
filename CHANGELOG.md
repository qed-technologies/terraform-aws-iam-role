# Release Notes

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
