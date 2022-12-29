output "fnd_bucket_name" {
    value = google_storage_bucket.fnd.name
}

output "forecast_bucket_name" {
    value = google_storage_bucket.forecast.name
}

output "gcf_bucket_name" {
    value = google_storage_bucket.gcf.name
}

output "rainfall_bucket_name" {
    value = google_storage_bucket.rainfall.name
}

output "rhrread_bucket_name" {
    value = google_storage_bucket.rhrread.name
}

output "temperature_bucket_name" {
    value = google_storage_bucket.temperature.name
}

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