output "function_name" {
  description = "Name of the deployed Lambda function"
  value       = aws_lambda_function.windows_device_validation.function_name
}

output "function_arn" {
  description = "ARN of the deployed Lambda function"
  value       = aws_lambda_function.windows_device_validation.arn
}

output "role_arn" {
  description = "Role ARN of the deployed Lambda function"
  value       = aws_iam_role.device_validation_role.arn
}

output "log_group_name" {
  description = "Log group name of the deployed Lambda function"
  value       = aws_cloudwatch_log_group.windows_device_validation.name
}