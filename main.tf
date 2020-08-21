// Zip file to upload function lambda
data "archive_file" "main" {
  count = var.enabled

  type        = "zip"
  source_dir  = var.code_location
  output_path = "${path.module}/.terraform/archive_files/${var.filename}"
}

resource "aws_lambda_function" "main" {
  count = var.enabled

  function_name    = var.lambda_function_name
  filename         = "${path.module}/.terraform/archive_files/${var.filename}"
  role             = var.lambda_iam_role
  handler          = "index.handler"
  runtime          = var.lambda_runtime
  timeout          = var.timeout
  memory_size      = var.memory
  source_code_hash = data.archive_file.main[count.index].output_base64sha256
  layers = [
    var.layer_arn
  ]

  environment {
    variables = var.environment_variables
  }

  vpc_config {
    subnet_ids         = var.subnets
    security_group_ids = var.sg_ids
  }
}

// CloudWatch logs to stream all module
resource "aws_cloudwatch_log_group" "main" {
  count             = var.enabled
  name              = "/aws/lambda/${var.lambda_function_name}"
  retention_in_days = 7
}
