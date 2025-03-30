variable "project_id" {
  description = "L'ID du projet Google Cloud"
  type        = string
}

variable "region" {
  description = "La région pour déployer Cloud Run"
  type        = string
  default     = "us-central1"
}

variable "firestore_location" {
  description = "L'emplacement pour la base de données Firestore"
  type        = string
  default     = "us-central"
}
