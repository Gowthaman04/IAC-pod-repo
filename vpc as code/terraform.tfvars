
project_id = "gowthampocacc"

region = "us-central1"

vpc_name = "network-prod"

nat_name = "nat-prod"

subnets = {
  app-subnet = {
    ip_cidr_range = "10.10.0.0/16"

    secondary_ip_range = {
      pods     = "10.20.0.0/20"
      services = "10.30.0.0/20"
    }
  }

  db-subnet = {
    ip_cidr_range = "10.11.0.0/16"

    secondary_ip_range = {
      db-secondary = "10.40.0.0/20"
    }
  }
}
