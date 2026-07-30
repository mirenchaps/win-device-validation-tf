variable "function_base_name" {
  type        = string
  description = "Base name of the Lambda; environment is appended"
}

variable "environment" {
  type        = string
  description = "Environment of the Lambda"
}

variable "handler" {
  type        = string
  description = "Lambda handler"
}

variable "function_runtime" {
  type        = string
  description = "Function runtime version"
}

variable "lambda_timeout" {
  type        = number
  description = "Timout of the lambda function"
}

variable "memory_size" {
  type        = number
  description = "Memory (MB) allocated to the Lambda"
  default     = 128
}

variable "source_dir" {
  type        = string
  description = "Source code to zip"
}


variable "log_prefix" {
  type        = string
  description = "Prefix of the log file"
}

variable "secrets_path" {
  type        = string
  description = "Path to mystical secrets"
}

variable "bucket_name" {
  type        = string
  description = "Bucket name"
}

variable "bucket_arn" {
  type        = string
  description = "Bucket arn"
}

variable "dynamodb_table_arn" {
  type        = string
  description = "ARN of the Dynamo DB Table"
}

variable "layer_arns" {
  type    = list(string)
  default = []
}