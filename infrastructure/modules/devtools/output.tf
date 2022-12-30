output "topic_id" {
  value       = google_pubsub_topic.this.id
  description = "The ID of the topic."
}