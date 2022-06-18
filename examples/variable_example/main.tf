
# This is an example of the arns used to create the policy.

variable "s3_arns" {
  type        = map(any)
  description = "S3 Bucket arn list"
  default = {
    # Add S3 arn string here in comma seperated list
    arn = [
      "arn:aws:s3:::client-qa-db",
      "arn:aws:s3:::client-uat-db",
      "arn:aws:s3:::client-qa-db/database/client-qa.sql",
      "arn:aws:s3:::client-uat-db/database/client-uat.sql"
    ]
  }
}

variable "additional_policy_arn" {
  type        = map(any)
  description = "additional policy"
  default = {
    arn = [
      "arn:aws:iam::000000000000:policy/Force_MFA",
    ]
  }
}

variable "group_user" {
  type        = map(any)
  description = "group users for s3 access"
  default = {
    # Add new user here in comma seperated list
    users = [
      "john.smith",
      "jane.doe",
      "keanu.reeves",
    ]
  }
}

variable "iam_user" {
  type        = map(any)
  description = "new users"
  default = {
    # Add new user here in comma seperated list
    users = [
      "keanu.reeves",
      "john.smith",
    ]
  }
}

variable "iam_group_name" {
	type = string
	default = "New-Group"
}


