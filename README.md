# FastAPI + Cloud Run + Firestore

Ce projet est un exemple simple d'une API FastAPI qui utilise Firestore comme base de données et est déployée sur Google Cloud Run avec Terraform.

## Structure du projet
```
/fastapi_app
  ├── main.py
  ├── database.py
  ├── models.py
  ├── requirements.txt
/terraform
  ├── main.tf
  ├── variables.tf
  ├── outputs.tf
  ├── terraform.tfvars.example
/.github/workflows
  ├── deploy.yml
/Dockerfile
```

## Démarrage local

1. Créez un environnement virtuel :
   ```
   python3 -m venv venv
   source venv/bin/activate
   ```

2. Installez les dépendances :
   ```
   pip install -r fastapi_app/requirements.txt
   ```

3. Lancez l'application :
   ```
   uvicorn fastapi_app.main:app --reload
   ```

4. Accédez à l'API à l'adresse : http://127.0.0.1:8000/docs

## Déploiement manuel sur Google Cloud Run

1. Activez les services GCP :
   ```
   gcloud services enable run.googleapis.com firestore.googleapis.com
   ```

2. Build et Push l'image Docker sur Google Container Registry ou L'Artefact Registry :
   ```
   gcloud builds submit --tag gcr.io/PROJECT_ID/fastapi-api
   ```

3. Déployez sur Cloud Run :
   ```
   gcloud run deploy fastapi-api --image gcr.io/PROJECT_ID/fastapi-api --platform managed --allow-unauthenticated
   ```

## Déploiement avec Terraform

1. Naviguez vers le dossier terraform :
   ```
   cd terraform
   ```

2. Copiez et configurez le fichier de variables :
   ```
   cp terraform.tfvars.example terraform.tfvars
   ```
   Puis éditez terraform.tfvars avec votre ID de projet GCP.

3. Initialisez Terraform :
   ```
   terraform init
   ```

4. Planifiez le déploiement :
   ```
   terraform plan
   ```

5. Appliquez la configuration :
   ```
   terraform apply
   ```

6. Pour supprimer les ressources :
   ```
   terraform destroy
   ```
