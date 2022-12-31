output "bucket_names" {
  value       = { for name in local.names : name => google_storage_bucket.buckets[name].name }
  description = "The name of buckets."
}