terraform {
  required_version = ">= 1.3.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file) # JSON key dosyası
  project     = "enuygun-455912"
  region      = "europe-west1"
}
