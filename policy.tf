resource "aws_iam_group_policy" "s3_access_policy" {
  name     = "s3_access_policy"
  group    = aws_iam_group.s3_access.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  # This 
  policy = jsonencode({
    "Version" = "2012-10-17",
    "Statement" = [
      {
        "Sid" = "",
        "Effect" = "Allow",
        "Action" =[
          "s3:ListBucket",
          "s3:GetObject",
          "s3:GetBucketLocation",
        ],
        "Resource" = [for arn in var.s3.arn : [format("%s%s,", "arn:aws:s3:::", arn )]]
      }
    ]
  })
  depends_on = [
    aws_iam_group.s3_access
  ]
}

