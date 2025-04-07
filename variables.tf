variable "project_id" {
  description = "enuygun-455912"
  type        = string
}

variable "region" {
  description = "GCP bölgesi"
  default     = "europe-west1"
}

variable "credentials_file" {
  description = "/Users/erkanmertgungor/Desktop/gke/enuygun-455912-61dd49b28094.json"
}

variable "cluster_name" {
  default     = "my-gke-cluster"
  description = "GKE cluster ismi"
}
