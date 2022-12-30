resource "google_storage_bucket" "fnd" {
  name     = "hko-fnd"
  location = var.location
}

resource "google_storage_bucket" "forecast" {
  name     = "hko-forecast"
  location = var.location
}

resource "google_storage_bucket" "rainfall" {
  name     = "hko-rainfall"
  location = var.location
}

resource "google_storage_bucket" "rhrread" {
  name     = "hko-rhrread"
  location = var.location
}

resource "google_storage_bucket" "temperature" {
  name     = "hko-temperature"
  location = var.location
}