variable "code_location" {
  description = "Folder code"
}

variable "filename" {
  description = "key value zip name"
}

variable "lambda_function_name" {
  description = "Lambda function name"
}

variable "lambda_runtime" {
  description = "Lambda runtime of function"
}

variable "lambda_iam_role" {
  description = "Lambda IAM role"
}

variable "environment_variables" {
  description = "Environment variables for lambda function"
  default     = {}
}

variable "subnets" {
  description = "Subnets"
  default     = []
}

variable "sg_ids" {
  description = "Security groups"
  default     = []
}

variable "timeout" {
  default = 3
}

variable "memory" {
  default = 128
}

variable "layer_arn" {}

variable "enabled" {}