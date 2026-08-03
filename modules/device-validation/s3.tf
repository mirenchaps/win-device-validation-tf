resource "aws_lambda_permission" "allow_s3" {
  for_each = var.source_buckets

  statement_id  = "AllowS3Invoke-${each.key}"
  principal     = "s3.amazonaws.com"
  action        = "lambda:InvokeFunction"
  source_arn    = each.value.arn
  function_name = aws_lambda_function.windows_device_validation.function_name
}

resource "aws_s3_bucket_notification" "windows_device_validation" {
  for_each = var.source_buckets

  bucket = each.value.name

  lambda_function {
    lambda_function_arn = aws_lambda_function.windows_device_validation.arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = var.log_prefix
  }

  depends_on = [aws_lambda_permission.allow_s3]
}
