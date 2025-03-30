from fastapi import FastAPI, HTTPException
from database import users_ref
from models import User

app = FastAPI()

@app.get("/")
def home():
    return {"message": "API FastAPI avec Firestore"}

@app.post("/users/")
def create_user(user: User):
    users_ref.document(user.id).set(user.dict())
    return {"message": "Utilisateur ajouté", "user": user}

@app.get("/users/{user_id}")
def get_user(user_id: str):
    doc = users_ref.document(user_id).get()
    if not doc.exists:
        raise HTTPException(status_code=404, detail="Utilisateur introuvable")
    return doc.to_dict()
