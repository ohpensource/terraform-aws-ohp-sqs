# General

variable "name_prefix" {}
variable "environment" {}
variable "tags" {
  type    = map
  default = {}
}
variable "region" { default = "eu-west-1" }

# SQS
variable "queue_names" {
  type    = list
  default = ["notify", "docs", "create"]
}

variable "create_deadletter_queues" {
  description = "Boolean for creating deadletter queues"
  default     = true
}

variable "content_based_deduplication" {
  description = "Enables content-based deduplication for FIFO queues"
  default     = false
}

variable "delay_seconds" {
  description = "The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900"
  default     = 90
}

variable "fifo_queue" {
  description = "Boolean designating a FIFO queue default "
  default     = false
}

variable "kms_data_key_reuse_period_seconds" {
  description = "The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours)"
  default     = 300
}

variable "max_message_size" {
  description = "The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB)"
  default     = 2048
}

variable "message_retention_seconds" {
  description = "The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days)"
  default     = 86400
}

variable "policy" {
  description = "The JSON policy for the SQS queue"
  default     = ""
}

variable "receive_wait_time_seconds" {
  description = "The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds)"
  default     = 10
}

variable "redrive_policy" {
  description = "The JSON policy to set up the Dead Letter Queue, see AWS docs. Note: when specifying maxReceiveCount, you must specify it as an integer (5), and not a string (\"5\")"
  default     = ""
}
variable "visibility_timeout_seconds" {
  description = "The visibility timeout for the queue. An integer from 0 to 43200 (12 hours)"
  default     = 30
}

variable "deadletter_max_receive_count" {
  default = 4
}

# KMS

variable "kms_master_key_id" {
  default     = ""
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK. For more information"
}
variable "encrypt_sqs" {
  default     = true
  type        = bool
  description = "If master key is not provided a AWS managed key will be created"
}

variable "key_usage" {
  description = "Specifies the intended use of the key. Valid values: ENCRYPT_DECRYPT or SIGN_VERIFY"
  default     = "ENCRYPT_DECRYPT"
}
variable "customer_master_key_spec" {
  description = "Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: SYMMETRIC_DEFAULT, RSA_2048, RSA_3072, RSA_4096, ECC_NIST_P256, ECC_NIST_P384, ECC_NIST_P521, or ECC_SECG_P256K1"
  default     = "SYMMETRIC_DEFAULT"
}
variable "kms_policy" {
  default     = ""
  description = "A valid policy JSON document"
}
variable "kms_deletion_window_in_days" {
  default     = 30
  description = "Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days"
}
variable "enable_key_rotation" {
  default     = true
  description = "Specifies whether key rotation is enabled"
}