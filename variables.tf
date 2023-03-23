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

variable "layer_arn" {
  default = null
}

variable "enabled" {
  default = true
}

variable "handler_name" {
  description = "Name of the file and the function handler"
  default = "index.handler"
}

variable "log_retention" {
  description = "Retention time in days for the logs data"
  default = 7
}