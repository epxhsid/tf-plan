variable "subnet_id" {
    description = "The ID of the subnet to use for the VMs to run."
    type = string
}

variable "instances" {
    description = "A map of instance names to their configurations."
    type = map(object({
        zone = string
        role = string
    }))
}

variable "machine_type" {
    description = "The machine type to use for the instances."
    type = string
    default = "e2-medium"
}

variable "boot_image" {
    type = string
    description = "The boot image to use for the instances."
    default = "ubuntu-os-cloud/ubuntu-2404-lts-amd64"
}