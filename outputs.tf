output "lambda_arn" {
  description = "ARN of function lambda"
  value       = join("", aws_lambda_function.main.*.arn)
}

output "invoke_arn" {
  value = join("", aws_lambda_function.main.*.invoke_arn)
}

output "function_name" {
  value = join("", aws_lambda_function.main.*.function_name)
}

output "lambda_role" {
  description = "IAM Role id to attach more policies"
  value = aws_iam_role.lambda_role.id
}

output "environment" {
  description = "Name of unique environment for lambda function"
  value = aws_lambda_function.main.*.environment
}
