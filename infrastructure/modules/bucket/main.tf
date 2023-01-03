resource "google_storage_bucket" "this" {
  name          = var.prefix == "" ? var.name : "${var.prefix}-${var.name}"
  location      = var.location
  force_destroy = var.force_destroy
  project       = var.project_id
}