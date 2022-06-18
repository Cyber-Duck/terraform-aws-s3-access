module "aws-terraform-s3-access" {
  source      = "git::https://github.com/Cyber-Duck/aws-terraform-s3-access.git?ref=TAG"

	iam_user = var.iam_user
	iam_group_name = "drupal-s3-access"
	s3_arns = var.s3_arns
	group_user = var.group_user
	additional_policy_arn = var.additional_policy_arn
}
