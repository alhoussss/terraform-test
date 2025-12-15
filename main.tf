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
    bucket = "terraform-state-alhousseini"
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