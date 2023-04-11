variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

# GKE cluster
resource "google_container_cluster" "primary" {
  name     = "${var.project_name}-gke"
  location = var.region

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
  # We set this to an empty value because of this:
  # https://github.com/hashicorp/terraform-provider-google/issues/10782
  ip_allocation_policy {}

  enable_autopilot = true
}
