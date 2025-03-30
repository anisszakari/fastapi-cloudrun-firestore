# Configuration du provider Google Cloud
provider "google" {
  project = var.project_id
  region  = var.region
}

# Configuration de l'API Cloud Run
resource "google_cloud_run_service" "default" {
  name     = "fastapi-api"
  location = var.region

  template {
    spec {
      containers {
        image = "gcr.io/${var.project_id}/fastapi-api"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

# Rendre le service Cloud Run accessible publiquement
resource "google_cloud_run_service_iam_member" "public_access" {
  service  = google_cloud_run_service.default.name
  location = google_cloud_run_service.default.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

# Configuration de Firestore
resource "google_firestore_database" "database" {
  project     = var.project_id
  name        = "(default)"
  location_id = var.firestore_location
  type        = "FIRESTORE_NATIVE"
}

# Sortie de l'URL du service Cloud Run
output "service_url" {
  value = google_cloud_run_service.default.status[0].url
}
