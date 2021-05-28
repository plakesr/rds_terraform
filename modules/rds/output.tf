locals {
  db_instance_id                    = element(concat(aws_db_instance.default.*.id, [""]), 0)
}

output "db_instance_id" {
  description = "The RDS instance ID"
  value       = local.db_instance_id
}