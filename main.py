from fastapi import FastAPI
from app.database import engine, Base
from app import models
from app.routers import users, kost

app = FastAPI(title="KostHub API", version="0.1")

# Buat semua tabel sesuai model (jika belum ada)
Base.metadata.create_all(bind=engine)

# Include routers
app.include_router(users.router, prefix="/users", tags=["Users"])
app.include_router(kost.router, prefix="/kost", tags=["Kost"])

@app.get("/")
def root():
    return {"message": "Welcome to KostHub API"}
