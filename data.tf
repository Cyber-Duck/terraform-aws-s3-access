data "aws_iam_group" "current_s3_users" {
  group_name = aws_iam_group.s3_access.name
}
