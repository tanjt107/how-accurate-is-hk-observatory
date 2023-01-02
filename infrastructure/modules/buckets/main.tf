resource "google_storage_bucket" "buckets" {
  for_each      = toset(var.names)
  name          = var.prefix == "" ? each.value : "${var.prefix}-${each.value}"
  location      = var.location
  force_destroy = var.force_destroy
}