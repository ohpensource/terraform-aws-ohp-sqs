output "queue_ids" {
  value = [for q in module.sqs : q.this_sqs_queue_id]
}

output "queue_arns" {
  value = [for q in module.sqs : q.this_sqs_queue_arn]
}

output "queue_names" {
  value = [for q in module.sqs : q.this_sqs_queue_name]
}
