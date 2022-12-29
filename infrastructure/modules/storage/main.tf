resource "google_storage_bucket" "fnd" {
    name     = var.fnd_bucket_name
    location = var.location
}

resource "google_storage_bucket" "forecast" {
    name     = var.forecast_bucket_name
    location = var.location
}

resource "google_storage_bucket" "rainfall" {
    name     = var.rainfall_bucket_name
    location = var.location
}

resource "google_storage_bucket" "rhrread" {
    name     = var.rhrread_bucket_name
    location = var.location
}

resource "google_storage_bucket" "temperature" {
    name     = var.temperature_bucket_name
    location = var.location
}

resource "google_storage_bucket" "gcf" {
    name     = var.gcf_bucket_name
    location = var.location
}

resource "google_storage_bucket_object" "extact" {
    name   = "extract.zip"
    bucket = google_storage_bucket.gcf.name
    source = "./modules/storage/gcf/extract/extract.zip"
}

resource "google_storage_bucket_object" "transform_fnd" {
    name   = "transform-fnd.zip"
    bucket = google_storage_bucket.gcf.name
    source = "./modules/storage/gcf/transform-fnd/transform-fnd.zip"
}

resource "google_storage_bucket_object" "transform_rhrread" {
    name   = "transform-rhrread.zip"
    bucket = google_storage_bucket.gcf.name
    source = "./modules/storage/gcf/transform-rhrread/transform-rhrread.zip"
}

resource "google_storage_bucket_object" "load" {
    name   = "load.zip"
    bucket = google_storage_bucket.gcf.name
    source = "./modules/storage/gcf/load/load.zip"
}