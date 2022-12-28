resource "google_bigquery_dataset" "dataset" {
    dataset_id                 = "hko"
    location                   = var.location
    # delete_contents_on_destroy = true
}

resource "google_pubsub_topic" "topic" {
    name = "topic"
}