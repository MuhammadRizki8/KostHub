from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy.orm import Session
from app import models, schemas
from app.database import get_db

router = APIRouter()

@router.post("/", response_model=schemas.KostResponse)
def create_kost(kost: schemas.KostCreate, db: Session = Depends(get_db)):
    # Cek apakah pemilik (user) ada
    pemilik = db.query(models.User).filter(models.User.id_user == kost.id_pemilik).first()
    if not pemilik:
        raise HTTPException(status_code=404, detail="Pemilik tidak ditemukan")
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

@router.get("/{kost_id}", response_model=schemas.KostResponse)
def read_kost(kost_id: int, db: Session = Depends(get_db)):
    kost = db.query(models.Kost).filter(models.Kost.id_kost == kost_id).first()
    if not kost:
        raise HTTPException(status_code=404, detail="Kost tidak ditemukan")
    return kost
