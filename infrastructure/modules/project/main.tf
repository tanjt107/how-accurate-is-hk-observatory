resource "google_project" "this" {
  name            = var.name
  project_id      = var.project_id
  billing_account = var.billing_account
}

resource "google_project_service" "this" {
  for_each                   = toset(var.activate_apis)
  service                    = each.value
  project                    = google_project.this.project_id
  disable_on_destroy         = var.disable_services_on_destroy
  disable_dependent_services = var.disable_dependent_services
}

data "google_storage_project_service_account" "this" {
  project = google_project.this.project_id
}

locals {
  service_account_emails = { "compute.googleapis.com" = data.google_storage_project_service_account.this.member }
}

resource "google_project_iam_member" "this" {
  for_each = { for i in var.activate_api_identities : i.api => i.role }
  project  = google_project.this.project_id
  role     = each.value
  member   = local.service_account_emails[each.key]
}