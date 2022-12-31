locals {
  names = toset(["fnd", "forecast", "rainfall", "rhrread", "temperature"])
}

resource "google_storage_bucket" "buckets" {
  for_each = local.names

  name     = "hko-${each.value}"
  location = var.location
}