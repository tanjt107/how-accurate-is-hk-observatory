output "extract_zip_name" {
    value = google_storage_bucket_object.extact.name
}

output "transform_fnd_zip_name" {
    value = google_storage_bucket_object.transform_fnd.name
}

output "transform_rhrread_zip_name" {
    value = google_storage_bucket_object.transform_rhrread.name
}

output "load_zip_name" {
    value = google_storage_bucket_object.load.name
}