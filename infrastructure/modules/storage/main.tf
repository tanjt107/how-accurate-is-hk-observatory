resource "google_storage_bucket" "fnd" {
    name          = var.fnd_bucket_name
    location      = var.bucket_location
    force_destroy = true
}

resource "google_storage_bucket" "rhrread" {
    name          = var.rhrread_bucket_name
    location      = var.bucket_location
    force_destroy = true
}

resource "google_storage_bucket" "gcf" {
    name     = var.gcf_bucket_name
    location = var.bucket_location
}

resource "google_storage_bucket_object" "extact" {
    name   = "extract.zip"
    bucket = google_storage_bucket.gcf.name
    source = "./modules/storage/gcf/extract/extract.zip"
}