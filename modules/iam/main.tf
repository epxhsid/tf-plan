# roles/iap.tunnelResourceAccessor
# roles/compute.osLogin
# roles/compute.osAdminLogin

resource "google_service_account" "k8s_node" {
    account_id   = "epxhsid-k8s-node"
    display_name = "Service account for Kubernetes nodes"
}

