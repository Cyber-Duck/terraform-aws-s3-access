output "group_name" {
  description = "Lists S3 access group name"
  value       = aws_iam_group.s3_access.name
}
output "group_users" {
  description = "List all S3 access group users"
  value       = data.aws_iam_group.current_s3_users.users
}
output "policy_arn" {
  description = "List S3 access policy arn"
  value       = aws_iam_policy.s3_access_policy.arn
}
