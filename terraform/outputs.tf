output "service_url" {
  description = "L'URL de l'API déployée sur Cloud Run"
  value       = google_cloud_run_service.default.status[0].url
}

output "firestore_database" {
  description = "Le nom de la base de données Firestore"
  value       = google_firestore_database.database.name
}
