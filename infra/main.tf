
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_compute_network" "vpc" {
  name                    = "terraform-lab-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "terraform-lab-subnet"
  region        = var.region
  ip_cidr_range = "10.10.0.0/24"
  network       = google_compute_network.vpc.id
}

resource "google_compute_instance" "vm" {
  name         = "terraform-lab-vm"
  machine_type = "e2-micro-bdiscn"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2404-lts-amd64"
      size  = 10
      type  = "pd-standard"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id
  }

  labels = {
    environment = "lab"
    created_by  = "terraform"
  }
}
