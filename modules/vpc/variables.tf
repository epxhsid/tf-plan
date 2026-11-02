variable "region" {
  type        = string
  description = "The region for the VPC subnetworks."
}

variable "environments" {
  type = map(object({
    cidr_range = string
    pod_cidr = string
    service_cidr = string
  }))

  description = "A map of environments with their respective CIDR ranges."
  
  default = {
    dev = {
      cidr_range   = "10.10.1.0/24"
      pod_cidr     = "172.16.0.0/18"
      service_cidr = "172.20.0.0/24"
    }
    staging = {
      cidr_range   = "10.10.2.0/24"
      pod_cidr     = "172.16.64.0/18"
      service_cidr = "172.20.1.0/24"
    }
    prod = {
      cidr_range   = "10.10.3.0/24"
      pod_cidr     = "172.16.128.0/18"
      service_cidr = "172.20.2.0/24"
    }
  }
}