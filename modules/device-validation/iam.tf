data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "device_validation_role" {
  name               = "${var.function_base_name}-${var.environment}-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.device_validation_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

data "aws_iam_policy_document" "permissions" {
  statement {
    actions   = ["s3:GetObject", "s3:DeleteObject"]
    resources = [for bucket in var.source_buckets : "${bucket.arn}/${var.log_prefix}*"]
    effect    = "Allow"
  }
  statement {
    actions   = ["s3:ListBucket"]
    resources = [for bucket in var.source_buckets : bucket.arn]
    effect    = "Allow"
  }
  statement {
    actions   = ["dynamodb:PutItem"]
    resources = [var.dynamodb_table_arn]
    effect    = "Allow"
  }
  statement {
    actions   = ["secretsmanager:GetSecretValue"]
    resources = [var.secrets_path]
    effect    = "Allow"

  }
}

resource "aws_iam_role_policy" "permissions" {
  name   = "lambda-permissions"
  role   = aws_iam_role.device_validation_role.id
  policy = data.aws_iam_policy_document.permissions.json
}