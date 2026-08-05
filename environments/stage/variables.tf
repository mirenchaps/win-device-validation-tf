variable "aws_region" {
  type        = string
  description = "AWS region for the prod environment"
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

variable "room_ids" {
  type        = map(string)
  description = "Webex room id per environment, keyed by env name"
}
