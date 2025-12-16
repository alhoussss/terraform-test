terraform {
  backend "gcs" {
    bucket = "terraform-state-alhousseini"
    prefix = "terraform/state"
  } 
}