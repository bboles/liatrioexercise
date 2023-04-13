output "region" {
  value       = var.region
  description = "GCP Region"
}

output "project_name" {
  value       = var.project_name
  description = "GCP Project Name"
}

output "project_id" {
  value       = var.project_id
  description = "GCP Project ID"
}

output "kubernetes_cluster_name" {
  value       = google_container_cluster.primary.name
  description = "GKE Cluster Name"
}

output "kubernetes_cluster_host" {
  value       = google_container_cluster.primary.endpoint
  description = "GKE Cluster Host"
}

# output "pool_name" {
#  description = "Workload Identity Pool name"
#  value       = google_iam_workload_identity_pool.githubpool.name
# }

# output "provider_name" {
#  description = "Workload Identity Provider name"
#  value       = google_iam_workload_identity_pool_provider.github.name
#}
