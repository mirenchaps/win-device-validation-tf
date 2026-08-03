variable "aws_region" {
  type        = string
  description = "AWS region for the dev environment"
  default     = "us-east-1"
}

variable "environment" {
  type        = string
  description = "Deployment environment name"
}

variable "memory_size" {
  type        = number
  description = "Memory (MB) allocated to Lambda"
}