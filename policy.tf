resource "aws_iam_policy" "s3_access_policy" {
  name     = "S3_Access"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  # This 
  policy = jsonencode({
    "Version" = "2012-10-17",
    "Statement" = [
      {
        "Sid" : "",
        "Effect" : "Allow",
        "Action" : [
          "s3:*",
        ],
        "Resource" : [for arn in var.s3.arn : format("%s%s,", "arn:aws:s3:::", arn )]
      }
    ]
  })
  depends_on = [
    aws_iam_group.s3_access
  ]
}
