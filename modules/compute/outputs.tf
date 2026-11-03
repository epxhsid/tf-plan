output "instance_names" {
    description = "names of the created instances."
    value = {
        for name, instance in google_compute_instance.node : name => instance.name
    }
}

output "internal_ips" {
    description = "private IP addresses of the created instances."
    value = {
        for name, instance in google_compute_instance.node : name => instance.network_interface[0].network_ip
    }
}

output "zones" {
    description = "zones of the created instances."
    value = {
        for name, instance in google_compute_instance.node : name => instance.zone
    }
}