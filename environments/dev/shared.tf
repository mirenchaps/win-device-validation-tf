resource "aws_s3_bucket" "device_logs" {
  bucket        = "win-device-validation-logs-dev"
  force_destroy = true
}

resource "aws_secretsmanager_secret" "config" {
  name                    = "win-device-validation/dev/apikeys"
  recovery_window_in_days = 0
}