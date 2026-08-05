output "function_name" {
  description = "Name of the deployed Lambda function"
  value       = module.device_validation.function_name
}

output "function_arn" {
  description = "ARN of the deployed Lambda function"
  value       = module.device_validation.function_arn
}

output "role_arn" {
  description = "Role ARN of the deployed Lambda function"
  value       = module.device_validation.role_arn
}

output "log_group_name" {
  description = "Log group name of the deployed Lambda function"
  value       = module.device_validation.log_group_name
}
