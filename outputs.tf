output "athena_workgroups_id" {
  description = "Map of id values across all athena_workgroups, keyed the same as var.athena_workgroups"
  value       = { for k, v in aws_athena_workgroup.athena_workgroups : k => v.id if v.id != null && length(v.id) > 0 }
}
output "athena_workgroups_arn" {
  description = "Map of arn values across all athena_workgroups, keyed the same as var.athena_workgroups"
  value       = { for k, v in aws_athena_workgroup.athena_workgroups : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "athena_workgroups_configuration" {
  description = "Map of configuration values across all athena_workgroups, keyed the same as var.athena_workgroups"
  value       = { for k, v in aws_athena_workgroup.athena_workgroups : k => one(v.configuration) if v.configuration != null && length(v.configuration) > 0 }
}
output "athena_workgroups_description" {
  description = "Map of description values across all athena_workgroups, keyed the same as var.athena_workgroups"
  value       = { for k, v in aws_athena_workgroup.athena_workgroups : k => v.description if v.description != null && length(v.description) > 0 }
}
output "athena_workgroups_force_destroy" {
  description = "Map of force_destroy values across all athena_workgroups, keyed the same as var.athena_workgroups"
  value       = { for k, v in aws_athena_workgroup.athena_workgroups : k => v.force_destroy if v.force_destroy != null }
}
output "athena_workgroups_name" {
  description = "Map of name values across all athena_workgroups, keyed the same as var.athena_workgroups"
  value       = { for k, v in aws_athena_workgroup.athena_workgroups : k => v.name if v.name != null && length(v.name) > 0 }
}
output "athena_workgroups_region" {
  description = "Map of region values across all athena_workgroups, keyed the same as var.athena_workgroups"
  value       = { for k, v in aws_athena_workgroup.athena_workgroups : k => v.region if v.region != null && length(v.region) > 0 }
}
output "athena_workgroups_state" {
  description = "Map of state values across all athena_workgroups, keyed the same as var.athena_workgroups"
  value       = { for k, v in aws_athena_workgroup.athena_workgroups : k => v.state if v.state != null && length(v.state) > 0 }
}
output "athena_workgroups_tags" {
  description = "Map of tags values across all athena_workgroups, keyed the same as var.athena_workgroups"
  value       = { for k, v in aws_athena_workgroup.athena_workgroups : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "athena_workgroups_tags_all" {
  description = "Map of tags_all values across all athena_workgroups, keyed the same as var.athena_workgroups"
  value       = { for k, v in aws_athena_workgroup.athena_workgroups : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}

