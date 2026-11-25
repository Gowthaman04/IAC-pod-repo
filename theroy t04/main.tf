resource "google_compute_network" "vpc" {
  name                    = "terraform-demo-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "terraform-demo-subnet"
  ip_cidr_range = "10.10.0.0/24"
  region        = var.region
  network       = google_compute_network.vpc.id
}

resource "google_compute_instance" "vm" {
  name         = "terraform-demo-vm"
  machine_type = "e2-micro"
  zone         = var.zone
  labels       = local.common_labels

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnet.id
  }
}