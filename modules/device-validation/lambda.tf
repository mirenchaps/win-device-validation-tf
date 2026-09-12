data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = var.source_dir
  output_path = "${path.module}/build/windows-device-validation.zip"
}

resource "aws_cloudwatch_log_group" "windows_device_validation" {
  name              = "/aws/lambda/${var.function_base_name}-${var.environment}"
  retention_in_days = 30
}

resource "aws_lambda_function" "windows_device_validation" {
  function_name    = "${var.function_base_name}-${var.environment}"
  role             = aws_iam_role.device_validation_role.arn
  handler          = var.handler
  runtime          = var.function_runtime
  memory_size      = var.memory_size
  timeout          = var.lambda_timeout
  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  layers           = var.layer_arns


  environment {
    variables = {
      SECRETS_PATH       = var.secrets_path
      BUCKET_ROOM_MAP    = jsonencode({ for env, bucket in var.source_buckets : bucket.name => var.room_ids[env] })
      FAILURE_TABLE_NAME = var.dynamodb_table_name

    }
  }

  depends_on = [aws_cloudwatch_log_group.windows_device_validation]

}