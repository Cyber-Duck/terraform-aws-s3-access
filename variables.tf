variable "iam_user" {
  type        = map(list(string))
  description = "new user creation, default = {['matt.smith', 'janes.doe']}"
}

variable "group_user" {
  type        = map(list(string))
  description = "Users to be added to S3 access group, default = {['matt.smith', 'janes.doe']}"
}

variable "iam_group_name" {
  type        = string
  description = "Name of IAM group to be created, e.g 'Drupal-devs'"
  default = null
}

variable "existing_group" {
  type = string
  description = "Existing IAM Group"
  default = null
}

variable "s3" {
  type = map(list(string))
  description = "name of S3 bucket to use, you can specify to a single file or folder by the path provided here. default = {['client-s3/folder/*', 'etc-s3/folder/mysql_dump.sql']}"
}

variable "additional_policy_arn" {
  type = map(list(string))
  description = "Policy ARN of any additional policys"
  default = null
}
