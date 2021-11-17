resource "aws_kms_key" "sqs" {
  count                    = local.create_kms_key
  description              = var.name_prefix
  deletion_window_in_days  = var.kms_deletion_window_in_days
  key_usage                = var.key_usage
  customer_master_key_spec = var.customer_master_key_spec
  policy                   = var.kms_policy
  enable_key_rotation      = var.enable_key_rotation

  tags = merge(var.tags,
    tomap({
      "Name"        = var.name_prefix,
      "Environment" = lower(var.environment)
    }),
  )
}

resource "aws_kms_alias" "sqs" {
  count         = local.create_kms_key
  name          = "alias/${var.name_prefix}"
  target_key_id = aws_kms_key.sqs[0].key_id
}
