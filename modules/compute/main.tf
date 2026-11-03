resource "google_compute_instance" "node" {
    for_each = var.instances

    boot_disk {
        initialize_params {
            image = var.boot_image
            size = 20
            type = "pd-standard"
        }
    }

    network_interface {
      subnetwork = var.subnet_id
    }

    metadata = {
        enable-oslogin = "TRUE"
    }

    name = each.key
    zone = each.value.zone
    machine_type = var.machine_type
    tags = ["k8s-node"]
}