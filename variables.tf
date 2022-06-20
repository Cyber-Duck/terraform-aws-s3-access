variable "iam_user" {
  type        = map(list(string))
  description = "new user creation, default = {['matt.smith', 'janes.doe']}"
  # validation {
  #   condition     = var.iam_user != null ? can(regex("^[0-9A-Za-z+=,.@_-]+$", var.iam_user)) : false
  #   error_message = "The var.iam_user must contain valid characters please refer to https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html."
  # }
}

variable "group_user" {
  type        = map(list(string))
  description = "Users to be added to S3 access group, default = {['matt.smith', 'janes.doe']}"
  default     = null
  # validation {
  #   condition     = var.group_user != null ? can(regex("^[0-9A-Za-z+=,.@_-]+$", var.group_user)) : false
  #   error_message = "The var.group_user must contain valid characters please refer to https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html."
  # }
}

variable "iam_group_name" {
  type        = string
  description = "Name of IAM group to be created, e.g 'Drupal-devs'"
  default     = null
  # validation {
  #   condition     = var.iam_group_name != null ? can(regex("^[0-9A-Za-z+=,.@_-]+$", var.iam_group_name)) : false
  #   error_message = "The var.iam_group_name must contain valid characters please refer to https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html."
  # }
}

variable "existing_group" {
  type        = string
  description = "Existing IAM Group"
  default     = null
  # validation {
  #   condition     = var.existing_group != null ? regex("^[0-9A-Za-z+=,.@_-]+$", var.existing_group) : null
  #   error_message = "The var.existing_group must contain valid characters please refer to https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html."
  # }
}

#! Validation requires more accepting Regex.
variable "s3_arns" {
  type        = map(list(string))
  description = "name of S3 bucket to use, you can specify to a single file or folder by the path provided here. default = {['client-s3/folder/*', 'etc-s3/folder/mysql_dump.sql']}"
  # validation {
  #   condition     = can(regex("^[arn:aws:s3:::a-z-\\.]+$", [for arns in var.s3_arns : arns.arn]))
  #   error_message = "The var.s3_arns value must start with 'arn:aws:s3:::'."
  # }
}

variable "additional_policy_arn" {
  type        = map(list(string))
  description = "Policy ARN of any additional policys"
  default     = null
  # validation {
  #   condition     = var.additional_policy_arn != null ? can(regex("^[arn:aws:a-z-\\.]+$", [for arns in var.additional_policy_arn.arn : arns])) : false
  #   error_message = "The var.additional_policy_arn value must start with 'arn:aws:' please refer to https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html."
  # }
}
