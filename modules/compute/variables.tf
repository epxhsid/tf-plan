variable "instances" {
  description = "map of instance names to their configurations."
  type = map(object({
    subnet_id = string
    zone      = string
    role      = string
  }))
}

variable "machine_type" {
  description = "machine type to use for the instances."
  type        = string
  default     = "e2-medium"
}

variable "boot_image" {
  type        = string
  description = "boot image to use for the instances."
  default     = "ubuntu-os-cloud/ubuntu-2404-lts-amd64"
}