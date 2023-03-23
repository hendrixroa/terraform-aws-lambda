data "archive_file" "main" {
  count = var.enabled ? 1 : 0

  type        = "zip"
  source_dir  = var.code_location
  output_path = "${path.module}/.terraform/archive_files/${var.filename}"
}