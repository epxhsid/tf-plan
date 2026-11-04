variable "project_id" {
  type        = string
  description = "The ID of the project in which to provision resources."
  default     = "gcp-dev-lab-2026-xyz"
}

variable "region" {
  type        = string
  description = "The region in which to provision resources."
  default     = "asia-southeast1"
}

variable "zone" {
  type        = string
  description = "The zone in which to provision resources."
  default     = "asia-southeast1-a"
}

variable "admin_email" {
  type        = string
  description = "The email address of the admin user."
}