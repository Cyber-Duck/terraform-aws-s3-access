resource "aws_iam_user" "new_user" {
  for_each = { for user in var.iam-user.users : user => user }
  name     = each.value

  tags = {
    user = format("%s_%s", each.value, "s3_access_user")
  }
}
