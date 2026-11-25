
output "vm_name" {
  value = google_compute_instance.vm.name
}

output "vm_internal_ip" {
  value = google_compute_instance.vm.network_interface[0].network_ip
}

output "vpc_name" {
  value = google_compute_network.vpc.name
}

output "subnet_name" {
  value = google_compute_subnetwork.subnet.name
}
