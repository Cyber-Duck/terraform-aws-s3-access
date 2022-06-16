resource "aws_iam_group" "s3_access" {
  name = var.iam_group_name
}

resource "aws_iam_group_membership" "access" {
  name     = format("%s-%s", var.iam_group_name, "membership")
  /* 
    Adding users to this list gives complete access to all DevOps spaces within company and client accounts. 
   */
  users = [for user in var.group_user.users : user]

  group = aws_iam_group.s3_access.name
  depends_on = [
    aws_iam_group.s3_access
  ]
}

resource "aws_iam_group_policy_attachment" "s3_access_policy_attachment" {
  group      = aws_iam_group.s3_access.name == null ? var.existing_group : aws_iam_group.s3_access.name
  policy_arn = aws_iam_policy.s3_access_policy.name
  depends_on = [
    aws_iam_group.s3_access,
    aws_iam_policy.s3_access_policy
  ]
}
