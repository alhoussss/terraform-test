provider "google" {
  project = "august-snowfall-481313-d1"
  credentials = file("key.json")
  region = "europe-west3"
  zone = "europe-west3-a"
}