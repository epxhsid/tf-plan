output "subnet_ids" {
  description = "IDs of the environment subnetworks."
  value = {
    for environment, subnet in google_compute_subnetwork.vpc_subnet : environment => subnet.id
  }
}