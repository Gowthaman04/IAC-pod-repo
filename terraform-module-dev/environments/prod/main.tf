module "mig_internal_lb" {
  source = "../../modules/mig-internal-lb"

  project_id      = var.project_id
  region          = var.region
  zone            = var.zone
  name            = "prod-web"
  network         = var.network
  subnetwork      = var.subnetwork
  machine_type    = "e2-micro"
  instance_count  = 2
  network_tags    = ["dev-web"]
}