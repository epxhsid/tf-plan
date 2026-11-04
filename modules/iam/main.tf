resource "google_service_account" "k8s_node" {
  account_id   = "epxhsid-k8s-node"
  display_name = "Service account for Kubernetes nodes"
}

resource "google_project_iam_member" "k8s_node_logging" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.k8s_node.email}"
}

resource "google_project_iam_member" "k8s_node_monitoring" {
  project = var.project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.k8s_node.email}"
}

output "k8s_node_service_account_email" {
  description = "Service account email attached to Kubernetes nodes."
  value       = google_service_account.k8s_node.email
}
