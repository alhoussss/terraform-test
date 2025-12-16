terraform {
  backend "gcs" {
    bucket = "backend-al-bucket"
    prefix = "terraform/state"
  } 
}