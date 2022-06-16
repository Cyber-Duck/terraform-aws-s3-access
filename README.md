<!-- BEGIN_TF_DOCS -->
<img src="https://www.drupal.org/files/CD-logo-vertical-RGB.png" />

---


# How to use this module

What you can achieve with this module.
- Creation of group with policy attached and managment of users via variables.
	- Ability to use existing groups.
- Ability to add additional policys to created or existing group via `additional_policy_arn` option.

# Informmation around user creations
When creating users with `iam_user` variable the users are created with no login credentials, you will have to manage all of this via the [console](https://console.aws.amazon.com). 

When managing group users you can list existing and new users, to remove a user from the IAM group just remove it from the list of users in the variables.
## Policy details

The policy curated in the module allows the users the ability to access s3 by detailing the buckets `arn` this additionally give you the ability to fine tune what the user has the ability to access within the S3 bucket.

---
# Example for a case where there is no existing group

```go
module "aws-terraform-s3-access" {
  source      = "git::https://github.com/Cyber-Duck/aws-terraform-s3-access.git"

	iam_user = var.iam_user
	iam_group_name = "drupal-s3-access"
	s3_arns = var.s3_arns
	group_user = var.group_user
	additional_policy_arn = var.additional_policy_arn
}
```

# Examples of existing group implementation

```go
module "aws-terraform-s3-access" {
  source      = "git::https://github.com/Cyber-Duck/aws-terraform-s3-access.git"

	iam_user = var.iam_user
	existing_group = "drupal-devs"
	s3_arns = var.s3_arns
	group_user = var.group_user
	additional_policy_arn = var.additional_policy_arn
}
```
# Example Variables
```go

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

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_policy_arn"></a> [additional\_policy\_arn](#input\_additional\_policy\_arn) | Policy ARN of any additional policys | `map(list(string))` | `null` | no |
| <a name="input_existing_group"></a> [existing\_group](#input\_existing\_group) | Existing IAM Group | `string` | `null` | no |
| <a name="input_group_user"></a> [group\_user](#input\_group\_user) | Users to be added to S3 access group, default = {['matt.smith', 'janes.doe']} | `map(list(string))` | n/a | yes |
| <a name="input_iam_group_name"></a> [iam\_group\_name](#input\_iam\_group\_name) | Name of IAM group to be created, e.g 'Drupal-devs' | `string` | `null` | no |
| <a name="input_iam_user"></a> [iam\_user](#input\_iam\_user) | new user creation, default = {['matt.smith', 'janes.doe']} | `map(list(string))` | n/a | yes |
| <a name="input_s3"></a> [s3](#input\_s3) | name of S3 bucket to use, you can specify to a single file or folder by the path provided here. default = {['client-s3/folder/*', 'etc-s3/folder/mysql\_dump.sql']} | `map(list(string))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_group_name"></a> [group\_name](#output\_group\_name) | Lists S3 access group name |
| <a name="output_group_users"></a> [group\_users](#output\_group\_users) | List all S3 access group users |
| <a name="output_policy_arn"></a> [policy\_arn](#output\_policy\_arn) | List S3 access policy arn |

## Resources

| Name | Type |
|------|------|
| [aws_iam_group.s3_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_membership.access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_policy_attachment.additional_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.s3_access_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.s3_access_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user.new_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_group.current_s3_users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_group) | data source |


<!-- END_TF_DOCS -->
