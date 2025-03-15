from fastapi import APIRouter, HTTPException, Depends, Query
from sqlalchemy.orm import Session
from app import models, schemas
from app.database import get_db
from typing import List

router = APIRouter(
    prefix="/kost",
    tags=["Kost"]
)


# =======================
# Create Kost
# =======================
@router.post("/", response_model=schemas.KostResponse)
def create_kost(kost: schemas.KostCreate, db: Session = Depends(get_db)):
    # Cek apakah pemilik (user) ada
    pemilik = db.query(models.User).filter(models.User.id_user == kost.id_pemilik).first()
    if not pemilik:
        raise HTTPException(status_code=404, detail="Pemilik tidak ditemukan")
    
    # Buat kost baru
    new_kost = models.Kost(
        id_pemilik=kost.id_pemilik,
        nama_kost=kost.nama_kost,
        alamat=kost.alamat,
        deskripsi=kost.deskripsi,
        harga_sewa=kost.harga_sewa,
        luas=kost.luas
    )
    db.add(new_kost)
    db.commit()
    db.refresh(new_kost)
    return new_kost


# =======================
# Get Kost by ID
# =======================
@router.get("/{kost_id}", response_model=schemas.KostResponse)
def read_kost(kost_id: int, db: Session = Depends(get_db)):
    kost = db.query(models.Kost).filter(models.Kost.id_kost == kost_id).first()
    if not kost:
        raise HTTPException(status_code=404, detail="Kost tidak ditemukan")
    return kost


# =======================
# Get All Kost (dengan limit)
# =======================
@router.get("/", response_model=List[schemas.KostResponse])
def get_all_kost(limit: int = Query(10, description="Jumlah maksimum kost yang ditampilkan"), db: Session = Depends(get_db)):
    kost_list = db.query(models.Kost).limit(limit).all()
    return kost_list
