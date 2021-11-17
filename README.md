# Terraform Module - SQS


[![license](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/ohpensource/terraform-aws-ohp-sqs/continuous-delivery)

![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/ohpensource/terraform-aws-ohp-sqs)

## Maintainer

* Platform Services

## Description

Creates AWS SQS queues

## Documentation

[confluence](https://ohpendev.atlassian.net/wiki/spaces/CCE/pages/2062320795/Terraform+Modules)

## Usage

<!--- BEGIN_TF_DOCS --->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_sqs"></a> [sqs](#module\_sqs) | terraform-aws-modules/sqs/aws | 2.1.0 |
| <a name="module_sqs_dl"></a> [sqs\_dl](#module\_sqs\_dl) | terraform-aws-modules/sqs/aws | 2.1.0 |

### Resources

| Name | Type |
|------|------|
| [aws_kms_alias.sqs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.sqs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_content_based_deduplication"></a> [content\_based\_deduplication](#input\_content\_based\_deduplication) | Enables content-based deduplication for FIFO queues | `bool` | `false` | no |
| <a name="input_create_deadletter_queues"></a> [create\_deadletter\_queues](#input\_create\_deadletter\_queues) | Boolean for creating deadletter queues | `bool` | `true` | no |
| <a name="input_customer_master_key_spec"></a> [customer\_master\_key\_spec](#input\_customer\_master\_key\_spec) | Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: SYMMETRIC\_DEFAULT, RSA\_2048, RSA\_3072, RSA\_4096, ECC\_NIST\_P256, ECC\_NIST\_P384, ECC\_NIST\_P521, or ECC\_SECG\_P256K1 | `string` | `"SYMMETRIC_DEFAULT"` | no |
| <a name="input_deadletter_max_receive_count"></a> [deadletter\_max\_receive\_count](#input\_deadletter\_max\_receive\_count) | n/a | `number` | `4` | no |
| <a name="input_delay_seconds"></a> [delay\_seconds](#input\_delay\_seconds) | The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 | `number` | `90` | no |
| <a name="input_enable_key_rotation"></a> [enable\_key\_rotation](#input\_enable\_key\_rotation) | Specifies whether key rotation is enabled | `bool` | `true` | no |
| <a name="input_encrypt_sqs"></a> [encrypt\_sqs](#input\_encrypt\_sqs) | If master key is not provided a AWS managed key will be created | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `any` | n/a | yes |
| <a name="input_fifo_queue"></a> [fifo\_queue](#input\_fifo\_queue) | Boolean designating a FIFO queue default | `bool` | `false` | no |
| <a name="input_key_usage"></a> [key\_usage](#input\_key\_usage) | Specifies the intended use of the key. Valid values: ENCRYPT\_DECRYPT or SIGN\_VERIFY | `string` | `"ENCRYPT_DECRYPT"` | no |
| <a name="input_kms_data_key_reuse_period_seconds"></a> [kms\_data\_key\_reuse\_period\_seconds](#input\_kms\_data\_key\_reuse\_period\_seconds) | The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours) | `number` | `300` | no |
| <a name="input_kms_deletion_window_in_days"></a> [kms\_deletion\_window\_in\_days](#input\_kms\_deletion\_window\_in\_days) | Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days | `number` | `30` | no |
| <a name="input_kms_master_key_id"></a> [kms\_master\_key\_id](#input\_kms\_master\_key\_id) | The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK. For more information | `string` | `""` | no |
| <a name="input_kms_policy"></a> [kms\_policy](#input\_kms\_policy) | A valid policy JSON document | `string` | `""` | no |
| <a name="input_max_message_size"></a> [max\_message\_size](#input\_max\_message\_size) | The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB) | `number` | `2048` | no |
| <a name="input_message_retention_seconds"></a> [message\_retention\_seconds](#input\_message\_retention\_seconds) | The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days) | `number` | `86400` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | n/a | `any` | n/a | yes |
| <a name="input_policy"></a> [policy](#input\_policy) | The JSON policy for the SQS queue | `string` | `""` | no |
| <a name="input_queue_names"></a> [queue\_names](#input\_queue\_names) | SQS | `list(any)` | <pre>[<br>  "notify",<br>  "docs",<br>  "create"<br>]</pre> | no |
| <a name="input_receive_wait_time_seconds"></a> [receive\_wait\_time\_seconds](#input\_receive\_wait\_time\_seconds) | The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds) | `number` | `10` | no |
| <a name="input_redrive_policy"></a> [redrive\_policy](#input\_redrive\_policy) | The JSON policy to set up the Dead Letter Queue, see AWS docs. Note: when specifying maxReceiveCount, you must specify it as an integer (5), and not a string ("5") | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"eu-west-1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | n/a | yes |
| <a name="input_visibility_timeout_seconds"></a> [visibility\_timeout\_seconds](#input\_visibility\_timeout\_seconds) | The visibility timeout for the queue. An integer from 0 to 43200 (12 hours) | `number` | `30` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_queue_arns"></a> [queue\_arns](#output\_queue\_arns) | n/a |
| <a name="output_queue_ids"></a> [queue\_ids](#output\_queue\_ids) | n/a |
| <a name="output_queue_names"></a> [queue\_names](#output\_queue\_names) | n/a |

<!--- END_TF_DOCS --->
