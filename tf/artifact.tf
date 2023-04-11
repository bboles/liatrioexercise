resource "google_artifact_registry_repository" "artifactrepo" {
  location      = var.region
  repository_id = "${var.project_name}-repo"
  description   = "Container repository"
  format        = "DOCKER"
}
