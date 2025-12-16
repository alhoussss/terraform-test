resource "google_compute_instance" "default" {
  name         = "my-instance-${count.index}"
  count         = length(var.instances)
  machine_type = element(var.instances, count.index)
  zone         = "us-central1-a"

boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    network = "default"
  }

}

resource "google_compute_network" "vpc_network" {
  name = "${var.name}-vpc"
  delete_default_routes_on_create = false
  auto_create_subnetworks           = false
  routing_mode                            = "REGIONAL"
  
}

resource "google_storage_bucket" "auto-al" {
  name          = "store-alhousseini-env"
  location      = "EU"
  force_destroy = true
  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }
}