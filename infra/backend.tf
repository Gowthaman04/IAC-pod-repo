
terraform {
  backend "gcs" {
    bucket = "gowthampocacc-tfstate-lab-20261116"
    prefix = "terraform-lab/infrastructure"
  }
}
