<img src="https://www.drupal.org/files/CD-logo-vertical-RGB.png" />
<!-- BEGIN_TF_DOCS -->

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.18.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.18.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_group.s3_access](https://registry.terraform.io/providers/hashicorp/aws/4.18.0/docs/resources/iam_group) | resource |
| [aws_iam_group_membership.access](https://registry.terraform.io/providers/hashicorp/aws/4.18.0/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_policy.s3_access_policy](https://registry.terraform.io/providers/hashicorp/aws/4.18.0/docs/resources/iam_group_policy) | resource |
| [aws_iam_group_policy_attachment.s3_access_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/4.18.0/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_user.new_user](https://registry.terraform.io/providers/hashicorp/aws/4.18.0/docs/resources/iam_user) | resource |
| [aws_iam_group.current_s3_users](https://registry.terraform.io/providers/hashicorp/aws/4.18.0/docs/data-sources/iam_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_existing_group"></a> [existing\_group](#input\_existing\_group) | Existing S3 bucket to use. | `string` | `null` | no |
| <a name="input_group_user"></a> [group\_user](#input\_group\_user) | Users to be added to S3 access group, default = {['matt.smith', 'janes.doe']} | `map(list(string))` | n/a | yes |
| <a name="input_iam-user"></a> [iam-user](#input\_iam-user) | new user creation, default = {['matt.smith', 'janes.doe']} | `map(list(string))` | n/a | yes |
| <a name="input_iam_group_name"></a> [iam\_group\_name](#input\_iam\_group\_name) | Name of IAM group to be created, e.g 'Drupal-devs' | `string` | n/a | yes |
| <a name="input_s3"></a> [s3](#input\_s3) | name of S3 bucket to use, you can specify to a single file or folder by the path provided here. default = {['client-s3/folder/*', 'etc-s3/folder/mysql\_dump.sql']} | `map(list(string))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_group_name"></a> [group\_name](#output\_group\_name) | Lists S3 access group name |
| <a name="output_group_users"></a> [group\_users](#output\_group\_users) | List all S3 access group users |
| <a name="output_policy_arn"></a> [policy\_arn](#output\_policy\_arn) | List S3 access policy arn |
<!-- END_TF_DOCS -->
