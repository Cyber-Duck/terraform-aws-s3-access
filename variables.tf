variable "iam-user" {
  type        = map(list(string))
  description = "new user creation, default = {['matt.smith', 'janes.doe']}"
  nullable = false
}

variable "group_user" {
  type        = map(list(string))
  description = "Users to be added to S3 access group, default = {['matt.smith', 'janes.doe']}"
  nullable = false
}

variable "iam_group_name" {
  type        = string
  description = "Name of IAM group to be created, e.g 'Drupal-devs'"
  nullable = false
}

variable "existing_group" {
  type = string
  description = "Existing S3 bucket to use."
  default = null
}

variable "s3" {
  type = map(list(string))
  description = "name of S3 bucket to use, you can specify to a single file or folder by the path provided here. default = {['client-s3/folder/*', 'etc-s3/folder/mysql_dump.sql']}"
}

