resource "google_project_service" "iap" {
  project = var.project_id
  service = "iap.googleapis.com"

  disable_on_destroy = false
}

resource "google_project_iam_member" "iap_tunnel" {
  project = var.project_id
  role    = "roles/iap.tunnelResourceAccessor"
  member  = "user:${var.admin_email}"
}

resource "google_project_iam_member" "os_admin_login" {
  project = var.project_id
  role    = "roles/compute.osAdminLogin"
  member  = "user:${var.admin_email}"
}