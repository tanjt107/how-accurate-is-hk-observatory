resource "google_pubsub_topic" "this" {
  name    = var.topic
  project = var.project_id
}