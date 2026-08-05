resource "aws_s3_bucket" "prod_logs" {
  bucket        = "windows-device-validation-logs-prod"
  force_destroy = true
}

resource "aws_secretsmanager_secret" "config" {
  name                    = "windows-device-validation/prod/apikeys"
  recovery_window_in_days = 0
}

resource "aws_dynamodb_table" "failures" {
  name         = "windows-device-validation-failures-prod"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "event_id"

  attribute {
    name = "event_id"
    type = "S"
  }
}
