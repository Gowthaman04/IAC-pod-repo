
variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "vpc_name" {
  description = "Name of the custom VPC"
  type        = string
  default     = "network-prod"
}

variable "subnets" {
  description = "Subnet configuration"
  type = map(object({
    ip_cidr_range      = string
    secondary_ip_range = map(string)
  }))
}

variable "nat_name" {
  description = "Cloud NAT name"
  type        = string
  default     = "nat-prod"
}
