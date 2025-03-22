from fastapi import FastAPI
from app.database import engine, Base
from app import models
from app.routers import users, kost, fasilitas, upload
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(title="KostHub API", version="0.1")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # domain yang diizinkan
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Buat semua tabel sesuai model (jika belum ada)
Base.metadata.create_all(bind=engine)

# Include routers
app.include_router(users.router, prefix="/users", tags=["Users"])
app.include_router(kost.router, prefix="/kost", tags=["Kost"])
app.include_router(fasilitas.router, prefix="/fasilitas", tags=["Fasilitas"])
app.include_router(upload.router, prefix="/upload", tags=["Upload"])  # Tambahkan router upload

@app.get("/")
def root():
    return {"message": "Welcome to KostHub API"}
