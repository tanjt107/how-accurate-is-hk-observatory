resource "google_storage_bucket" "fnd_raw" {
    name          = var.fnd_raw_bucket_name
    location      = var.bucket_location
    force_destroy = true
}

resource "google_storage_bucket" "rhrread_raw" {
    name          = var.rhrread_raw_bucket_name
    location      = var.bucket_location
    force_destroy = true
}

resource "google_storage_bucket" "gcf" {
    name     = var.gcf_bucket_name
    location = var.bucket_location
}

resource "google_storage_bucket_object" "object" {
    name   = "hko.zip"
    bucket = google_storage_bucket.gcf.name
    source = "./modules/storage/hko.zip"
}