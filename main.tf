resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = "europe-west1"

  remove_default_node_pool = true
  initial_node_count       = 1

  logging_service    = "none" # Logging kapalı
  monitoring_service = "none" # Monitoring kapalı

  network    = "default"
  subnetwork = "default"
}

resource "google_container_node_pool" "main_pool" {
  name       = "main-pool"
  location   = "europe-west1"
  cluster    = google_container_cluster.primary.name
  node_count = 1 # Autoscaling yok

  node_config {
    machine_type = "n2d-standard-2"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

resource "google_container_node_pool" "application_pool" {
  name     = "application-pool"
  location = "europe-west1"
  cluster  = google_container_cluster.primary.name

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  node_config {
    machine_type = "n2d-standard-2"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]

    labels = {
      pool = "application"
    }

    taint {
      key    = "app"
      value  = "true"
      effect = "NO_SCHEDULE"
    }
  }
}
