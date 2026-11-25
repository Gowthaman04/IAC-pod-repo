locals {
  environment = "dev"

  common_labels = {
    environment = local.environment
    managed_by  = "terraform"
  }
}