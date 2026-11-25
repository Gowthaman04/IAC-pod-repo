
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
  project = "gowthampocacc"
  region  = "us-central1"
}

resource "google_storage_bucket" "terraform_backend" {
  name     = "gowthampocacc-tfstate-lab-20261116"
  location = "US-CENTRAL1"

  storage_class = "STANDARD"

  uniform_bucket_level_access = true

  public_access_prevention = "enforced"

  versioning {
    enabled = true
  }

  labels = {
    environment = "lab"
    purpose     = "terraform-backend"
  }

  lifecycle {
    prevent_destroy = true
  }
}

output "backend_bucket" {
  value = google_storage_bucket.terraform_backend.name
}
