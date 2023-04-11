locals {
  ghrepo = "bboles/liatrioexercise"
}

resource "google_iam_workload_identity_pool" "githubpool" {
  workload_identity_pool_id = "ghauth-pool"
}

# Service account used by Github Actions for accessing images in our repo.
resource "google_service_account" "sa" {
  account_id   = "githubactionssvc"
  display_name = "Github Actions Service Account"
  description  = "Service account used for Github Actions"
}

resource "google_project_iam_binding" "sabind" {
  project = var.project_name
  role    = "roles/editor"

  members = [
    "serviceAccount:${google_service_account.sa.email}"
  ]
}

resource "google_service_account_iam_member" "workload_identity_user" {
  service_account_id = google_service_account.sa.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.githubpool.name}/attribute.repository/${local.ghrepo}"
}

resource "google_iam_workload_identity_pool_provider" "github" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.githubpool.workload_identity_pool_id
  workload_identity_pool_provider_id = "ghauth-provider"
  project                            = var.project_id
  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.aud"        = "assertion.aud"
    "attribute.repository" = "assertion.repository"
  }
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}
