module "sqs" {
  for_each = toset(var.queue_names)
  source   = "terraform-aws-modules/sqs/aws"
  version  = "4.0.0"

  name                              = "${var.name_prefix}-${each.key}"
  kms_master_key_id                 = local.kms_master_key_id
  content_based_deduplication       = var.content_based_deduplication
  delay_seconds                     = var.delay_seconds
  fifo_queue                        = var.fifo_queue
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds
  max_message_size                  = var.max_message_size
  message_retention_seconds         = var.message_retention_seconds
  policy                            = var.policy
  receive_wait_time_seconds         = var.receive_wait_time_seconds
  redrive_policy = var.create_deadletter_queues ? jsonencode({
    deadLetterTargetArn = module.sqs_dl[each.key].this_sqs_queue_arn
    maxReceiveCount     = var.deadletter_max_receive_count
  }) : ""
  visibility_timeout_seconds = var.visibility_timeout_seconds
  tags = merge(var.tags, tomap({
    "Name" = "${var.name_prefix}-${each.key}",
    "Workspace" = terraform.workspace }
  ))
}

module "sqs_dl" {
  for_each = toset(local.deadletter_queues)
  source   = "terraform-aws-modules/sqs/aws"
  version  = "4.0.0"

  name                              = "${var.name_prefix}-${each.key}-dl"
  kms_master_key_id                 = local.kms_master_key_id
  content_based_deduplication       = var.content_based_deduplication
  delay_seconds                     = var.delay_seconds
  fifo_queue                        = var.fifo_queue
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds
  max_message_size                  = var.max_message_size
  message_retention_seconds         = var.message_retention_seconds
  policy                            = var.policy
  receive_wait_time_seconds         = var.receive_wait_time_seconds
  redrive_policy                    = ""
  visibility_timeout_seconds        = var.visibility_timeout_seconds
  tags = merge(var.tags, tomap(
    { "Name" = "${var.name_prefix}-${each.key}-dl",
    "Workspace" = terraform.workspace }
  ))
}
