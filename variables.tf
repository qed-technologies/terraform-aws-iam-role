# ----------
#  Control
# ----------
variable "create" {
  type        = bool
  description = "Controls resource creation"
  default     = false
}

variable "is_instance_profile" {
  type        = bool
  description = "Determines if the IAM role will be associated to an IAM instance profile"
  default     = false
}

# -------
#  Role
# -------
variable "managed_policy_arns" {
  type        = list(string)
  description = "A list of Managed Role Policy ARNs"
  default     = []
}

variable "customer_managed_policies" {
  type = list(object({
    name        = string
    description = string
    policy      = string
  }))
  description = "A list of objects defining role policies to be attached to the IAM role"
  default     = []
}

variable "description" {
  type        = string
  description = "A description for the IAM role"
  default     = ""
}

variable "force_detach_policies" {
  type        = bool
  description = "Forces the policies to be detached before destroying the role"
  default     = false
}

variable "max_session_duration" {
  type        = number
  description = "The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour (3600 seconds) to 12 hours (43200)"
  default     = 3600
}

variable "name" {
  type        = string
  description = "The name of the role"
  default     = ""
}

variable "path" {
  type        = string
  description = "Path under which the role resides"
  default     = "/"
}

variable "permissions_boundary_arn" {
  type        = string
  description = "The ARN of the policy that is used to set the permissions boundary for the role"
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to apply to the IAM role"
  default     = {}
}

variable "trusted_identities" {
  type        = list(string)
  description = "A list of ARNs this role will trust"
  default     = []
}

variable "trusted_services" {
  type        = list(string)
  description = "A list of AWS Services this role will trust"
  default     = []
}
