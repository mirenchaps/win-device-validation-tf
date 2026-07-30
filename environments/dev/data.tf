data "aws_dynamodb_table" "failures" {
  name = "DeviceFailureLogs"
}

data "aws_lambda_layer_version" "common_deps" {
  layer_name = "my-common-dependencies"
}