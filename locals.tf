locals {
  deadletter_queues = var.create_deadletter_queues ? var.queue_names : null

  create_kms_key    = var.encrypt_sqs == true && var.kms_master_key_id == "" ? 1 : 0
  kms_master_key_id = (var.encrypt_sqs == true && var.kms_master_key_id == "") ? aws_kms_key.sqs[0].key_id : (var.encrypt_sqs == true && var.kms_master_key_id != "") ? var.kms_master_key_id : ""

}