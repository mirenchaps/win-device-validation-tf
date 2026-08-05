resource "aws_s3_bucket" "stage_logs" {
  bucket        = "windows-device-validation-logs-stage"
  force_destroy = true
}

resource "aws_secretsmanager_secret" "config" {
  name                    = "windows-device-validation/stage/apikeys"
  recovery_window_in_days = 0
}

resource "aws_dynamodb_table" "failures" {
  name         = "windows-device-validation-failures-stage"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "event_id"

  attribute {
    name = "event_id"
    type = "S"
  }
}
