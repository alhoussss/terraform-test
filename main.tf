resource "google_service_account" "default" {
  account_id   = "august-snowfall-481313-d1"
  display_name = "VM Instance"
}

resource "google_compute_instance" "default" {
  name         = "my-instance"
  machine_type = "n2-standard-2"
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
  name = "vpc-network"
}

terraform {
  backend "gcs" {
    bucket = "store-alhousseini-env"
  } 
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