resource "google_bigquery_dataset" "dataset" {
    dataset_id = "hko"
    location   = var.location
}

resource "google_bigquery_dataset_access" "access" {
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  role       = "roles/bigquery.dataViewer"
  iam_member = "allUsers"
}

resource "google_pubsub_topic" "topic" {
    name = "topic"
}