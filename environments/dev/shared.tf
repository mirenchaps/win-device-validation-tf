resource "aws_s3_bucket" "dev_logs" {
  bucket        = "win-device-validation-logs-dev"
  force_destroy = true
}

resource "aws_s3_bucket" "stage_logs" {
  bucket        = "win-device-validation-logs-stage"
  force_destroy = true
}

resource "aws_s3_bucket" "prod_logs" {
  bucket        = "win-device-validation-logs-prod"
  force_destroy = true
}

resource "aws_secretsmanager_secret" "config" {
  name                    = "win-device-validation/dev/apikeys"
  recovery_window_in_days = 0
}

