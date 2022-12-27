output "dataset_id" {
    value = google_bigquery_dataset.dataset.dataset_id
}

output "pubsub_topic_id" {
    value = google_pubsub_topic.topic.id
}