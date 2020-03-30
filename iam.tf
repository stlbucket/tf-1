# IAM
resource "aws_iam_role" "role" {
  name = "lambda_role_lscm"

  assume_role_policy = "${file("lambda-assume-policy.json")}"
}