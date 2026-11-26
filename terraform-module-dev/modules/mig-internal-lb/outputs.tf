output "mig_name" {
  value = google_compute_instance_group_manager.this.name
}

output "instance_group" {
  value = google_compute_instance_group_manager.this.instance_group
}

output "internal_lb_ip" {
  value = google_compute_forwarding_rule.this.ip_address
}

output "backend_service_name" {
  value = google_compute_region_backend_service.this.name
}