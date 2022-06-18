variable "iam_user" {
  type        = map(list(string))
  description = "new user creation, default = {['matt.smith', 'janes.doe']}"
  validation {
    condition     = can(regex("^[0-9A-Za-z+=,.@_-]+$", var.iam_user))
    error_message = "The var.iam_user must contain valid characters please refer to https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html."
  }
}

variable "group_user" {
  type        = map(list(string))
  description = "Users to be added to S3 access group, default = {['matt.smith', 'janes.doe']}"
  validation {
    condition     = can(regex("^[0-9A-Za-z+=,.@_-]+$", var.group_user))
    error_message = "The var.group_user must contain valid characters please refer to https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html."
  }
}

variable "iam_group_name" {
  type        = string
  description = "Name of IAM group to be created, e.g 'Drupal-devs'"
  nullable = true
  validation {
    condition     = can(regex("^[0-9A-Za-z+=,.@_-]+$", var.iam_group_name))
    error_message = "The var.iam_group_name must contain valid characters please refer to https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html."
  }
}

variable "existing_group" {
  type        = string
  description = "Existing IAM Group"
  nullable = true
  validation {
    condition     = can(regex("^[0-9A-Za-z+=,.@_-]+$", var.existing_group))
    error_message = "The var.existing_group must contain valid characters please refer to https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_iam-quotas.html."
  }
}

variable "s3_arns" {
  type        = map(list(string))
  description = "name of S3 bucket to use, you can specify to a single file or folder by the path provided here. default = {['client-s3/folder/*', 'etc-s3/folder/mysql_dump.sql']}"
  validation {
    condition     = can(substr(var.s3_arns, 0, 13) == "arn:aws:s3:::")
    error_message = "The var.s3_arns value must start with 'arn:aws:s3:::'."
  }
}

variable "additional_policy_arn" {
  type        = map(list(string))
  description = "Policy ARN of any additional policys"
  nullable = true
  validation {
    condition     = can(substr(var.additional_policy_arn, 0, 8) == "arn:aws:")
    error_message = "The var.additional_policy_arn value must start with 'arn:aws:' please refer to https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html."
  }
}
