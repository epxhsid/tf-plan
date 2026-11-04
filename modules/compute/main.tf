resource "google_compute_instance" "node" {
  for_each = var.instances

  boot_disk {
    initialize_params {
      image = var.boot_image
      size  = 20
      type  = "pd-standard"
    }
  }

  network_interface {
    subnetwork = each.value.subnet_id
  }

  metadata = {
    enable-oslogin = "TRUE"
  }

  service_account {
    email  = var.service_account_email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  name         = each.key
  zone         = each.value.zone
  machine_type = var.machine_type
  tags         = ["k8s-node"]
}