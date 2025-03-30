from google.cloud import firestore

# Initialisation du client Firestore
db = firestore.Client()
users_ref = db.collection("users")
