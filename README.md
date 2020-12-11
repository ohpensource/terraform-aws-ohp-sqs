# Terraform SQS Module for NewStack Services

Current version: v0.3.0

Based on Terraform Registry module "terraform-aws-modules/sqs/aws"

Creates SQS queues with or without encryption based on a list of queue names. Will also create deadletter queues if required and an appropriate redriver policy.

An SQS policy can be specified by passing a JSON formatted policy.


## Usage

## Usage

```(terraform)
module "aws_chatops" {
  source = "git::ssh://git@bitbucket.org/ohpen-dev/terraform-aws-ns-sqs?ref=v0.3.0"

  name_prefix = ""
  queue_names = ""
}
```


## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | n/a | `any` | `""` | no |
| name\_prefix | n/a | `any` | n/a | yes |
| tags | n/a | `map` | `{}` | no |
| queue\_names | SQS | `list` | <pre>[<br>  "notify",<br>  "docs",<br>  "create"<br>]</pre> | no |
| content\_based\_deduplication | Enables content-based deduplication for FIFO queues | `bool` | `false` | no |
| create\_deadletter\_queues | Boolean for creating deadletter queues | `bool` | `true` | no |
| customer\_master\_key\_spec | Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: SYMMETRIC\_DEFAULT, RSA\_2048, RSA\_3072, RSA\_4096, ECC\_NIST\_P256, ECC\_NIST\_P384, ECC\_NIST\_P521, or ECC\_SECG\_P256K1 | `string` | `"SYMMETRIC_DEFAULT"` | no |
| deadletter\_max\_receive\_count | n/a | `number` | `4` | no |
| delay\_seconds | The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 | `number` | `90` | no |
| enable\_key\_rotation | Specifies whether key rotation is enabled | `bool` | `true` | no |
| encrypt\_sqs | If master key is not provided a AWS managed key will be created | `bool` | `true` | no |
| fifo\_queue | Boolean designating a FIFO queue default | `bool` | `false` | no |
| key\_usage | Specifies the intended use of the key. Valid values: ENCRYPT\_DECRYPT or SIGN\_VERIFY | `string` | `"ENCRYPT_DECRYPT"` | no |
| kms\_data\_key\_reuse\_period\_seconds | The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours) | `number` | `300` | no |
| kms\_deletion\_window\_in\_days | Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days | `number` | `30` | no |
| kms\_master\_key\_id | The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK. For more information | `string` | `""` | no |
| kms\_policy | A valid policy JSON document | `string` | `""` | no |
| max\_message\_size | The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB) | `number` | `2048` | no |
| message\_retention\_seconds | The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days) | `number` | `86400` | no |
| policy | The JSON policy for the SQS queue | `string` | `""` | no |

| receive\_wait\_time\_seconds | The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds) | `number` | `10` | no |
| redrive\_policy | The JSON policy to set up the Dead Letter Queue, see AWS docs. Note: when specifying maxReceiveCount, you must specify it as an integer (5), and not a string ("5") | `string` | `""` | no |
| visibility\_timeout\_seconds | The visibility timeout for the queue. An integer from 0 to 43200 (12 hours) | `number` | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| queue\_arns | n/a |
| queue\_ids | n/a |
| queue\_names | n/a |

