provider "google" {
  project = "your-gcp-project-id"
  region  = "us-central1"
}

resource "google_container_cluster" "gke_cluster" {
  name     = "multi-cloud-gke"
  location = "us-central1"

  node_pool {
    name       = "default-pool"
    node_count = 2
    machine_type = "e2-medium"
  }
}

output "gke_cluster_endpoint" {
  value = google_container_cluster.gke_cluster.endpoint
}