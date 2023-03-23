resource "aws_lambda_function" "main" {
  count = var.enabled ? 1 : 0

  function_name    = var.lambda_function_name

  handler          = var.handler_name
  runtime          = var.lambda_runtime
  timeout          = var.timeout
  memory_size      = var.memory
  role             = aws_iam_role.lambda_role.arn

  filename         = "${path.module}/.terraform/archive_files/${var.filename}"
  source_code_hash = data.archive_file.main[count.index].output_base64sha256

  environment {
    variables = var.environment_variables
  }

  vpc_config {
    subnet_ids         = var.subnets
    security_group_ids = var.sg_ids
  }

  layers = var.layer_arn != null ? [ var.layer_arn ] : null
}
