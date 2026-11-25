
output "vpc_name" {
  description = "Created VPC name"
  value       = google_compute_network.vpc.name
}

output "vpc_self_link" {
  description = "VPC self link"
  value       = google_compute_network.vpc.self_link
}

output "subnet_names" {
  description = "Created subnet names"
  value       = [for subnet in google_compute_subnetwork.subnets : subnet.name]
}

output "subnet_self_links" {
  description = "Subnet self links"
  value       = { for name, subnet in google_compute_subnetwork.subnets : name => subnet.self_link }
}

output "cloud_router_name" {
  description = "Cloud Router name"
  value       = google_compute_router.router.name
}

output "cloud_nat_name" {
  description = "Cloud NAT name"
  value       = google_compute_router_nat.nat.name
}
