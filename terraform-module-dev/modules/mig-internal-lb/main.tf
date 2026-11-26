resource "google_compute_instance_template" "this" {
  name_prefix  = "${var.name}-template-"
  machine_type = var.machine_type

  tags = var.network_tags

  disk {
    source_image = "debian-cloud/debian-12"
    auto_delete  = true
    boot         = true

    disk_size_gb = 10
  }

  network_interface {
    subnetwork = var.subnetwork
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt-get update
    apt-get install -y nginx
    echo "Hello from ${var.name}" > /var/www/html/index.html
    systemctl enable nginx
    systemctl restart nginx
  EOT

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_health_check" "this" {
  name = "${var.name}-health-check"

  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2

  http_health_check {
    port = 80
    request_path = "/"
  }
}

resource "google_compute_instance_group_manager" "this" {
  name               = "${var.name}-mig"
  base_instance_name = "${var.name}-vm"
  zone               = var.zone

  version {
    instance_template = google_compute_instance_template.this.id
  }

  target_size = var.instance_count

  named_port {
    name = "http"
    port = 80
  }
}

resource "google_compute_region_backend_service" "this" {
  name                  = "${var.name}-backend"
  region                = var.region
  protocol              = "TCP"
  load_balancing_scheme = "INTERNAL"

  health_checks = [
    google_compute_health_check.this.id
  ]

  backend {
    group          = google_compute_instance_group_manager.this.instance_group
    balancing_mode = "CONNECTION"
  }
}

resource "google_compute_forwarding_rule" "this" {
  name                  = "${var.name}-ilb"
  region                = var.region
  load_balancing_scheme = "INTERNAL"
  ip_protocol           = "TCP"
  ports                 = ["80"]

  backend_service = google_compute_region_backend_service.this.id
  network         = var.network
  subnetwork      = var.subnetwork
}