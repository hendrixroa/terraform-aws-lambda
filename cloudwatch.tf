resource "aws_cloudwatch_log_group" "main" {
  count             = var.enabled ? 1 : 0

  name              = "/aws/lambda/${var.lambda_function_name}"
  retention_in_days = var.log_retention
}