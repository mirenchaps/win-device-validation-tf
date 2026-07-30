resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowS3Invoke"
  principal     = "s3.amazonaws.com"
  action        = "lambda:InvokeFunction"
  source_arn    = var.bucket_arn
  function_name = aws_lambda_function.windows_device_validation.function_name
}

resource "aws_s3_bucket_notification" "windows_device_validation" {
  bucket = var.bucket_name

  lambda_function {
    lambda_function_arn = aws_lambda_function.windows_device_validation.arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = var.log_prefix
  }

  depends_on = [aws_lambda_permission.allow_s3]
}
