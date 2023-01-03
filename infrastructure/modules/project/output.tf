output "project_id" {
  description = "ID of the project."
  value       = google_project.this.project_id
}

output "enabled_apis" {
  description = "Enabled APIs in the project."
  value       = [for api in google_project_service.this : api.service]
}

output "enabled_iam_members" {
  description = "IAM policy to grant a role to a new member."
  value       = [{ for i in google_project_iam_member.this : i.member => i.role }]
}