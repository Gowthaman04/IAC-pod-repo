variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "name" {
  type = string
}

variable "network" {
  type = string
}

variable "subnetwork" {
  type = string
}

variable "machine_type" {
  type    = string
  default = "e2-micro"
}

variable "instance_count" {
  type    = number
  default = 2
}

variable "network_tags" {
  type    = list(string)
  default = []
}