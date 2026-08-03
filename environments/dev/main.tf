module "device_validation" {
  source = "../../modules/device-validation"

  function_base_name = "windows_device_validation"
  environment        = var.environment
  handler            = "lambda_function.lambda_handler"
  function_runtime   = "python3.13"
  lambda_timeout     = 120
  memory_size        = var.memory_size
  log_prefix         = "device-validation-logs/"

  secrets_path       = aws_secretsmanager_secret.config.arn
  dynamodb_table_arn = data.aws_dynamodb_table.failures.arn
  layer_arns         = [data.aws_lambda_layer_version.common_deps.arn]


  bucket_name = aws_s3_bucket.device_logs.bucket
  bucket_arn  = aws_s3_bucket.device_logs.arn

  source_dir = "${path.module}/../../../device-validation/aws-lambda/windows-log-processor"
}

