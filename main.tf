terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_compute_network" "vpc_network" {
  name = "epxhsid-vpc-network"
  auto_create_subnetworks = false
  description = "VPC network for my project."
}

resource "google_compute_subnetwork" "vpc_subnet" {
  for_each = var.environments

  name = "epxhsid-${each.key}-subnet"
 
  network = google_compute_network.vpc_network.id
  ip_cidr_range = each.value.cidr_range
  region = var.region
  private_ip_google_access = true
  description = "Subnetwork for ${each.key} environment."

  secondary_ip_range {
    range_name = "epxhsid-${each.key}-pod-range"
    ip_cidr_range = each.value.pod_cidr
  }

  secondary_ip_range {
    range_name = "epxhsid-${each.key}-service-range"
    ip_cidr_range = each.value.service_cidr
  }
}