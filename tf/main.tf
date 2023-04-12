terraform {
  # With this backend configuration we are telling Terraform that the
  # created state should be saved in some Google Cloud Bucket with some prefix.
  backend "gcs" {
    bucket = "liatrioexercise-state"
    prefix = "terraform/state"
  }
}

# We define the "google" provider with the project and the general region + zone.
provider "google" {
  project = var.project_name
  region  = var.region
  zone    = var.zone
}


# Enable the Compute Engine API.
resource "google_project_service" "compute" {
  project            = var.project_name
  service            = "compute.googleapis.com"
  disable_on_destroy = true
}
# Enable the Kubernetes API.
resource "google_project_service" "container" {
  project            = var.project_name
  service            = "container.googleapis.com"
  disable_on_destroy = true
}
# Enable the Artifact Registry API.
resource "google_project_service" "artifactregistry" {
  project            = var.project_name
  service            = "artifactregistry.googleapis.com"
  disable_on_destroy = true
}
# Enable the Cloud Resource Manager API.
resource "google_project_service" "crm" {
  project            = var.project_name
  service            = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = true
}
# Enable the Service Usage API.
resource "google_project_service" "service_usage" {
  project            = var.project_name
  service            = "serviceusage.googleapis.com"
  disable_on_destroy = true
}

