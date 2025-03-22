from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy.orm import Session
from app import models, schemas
from app.database import get_db
from typing import List

router = APIRouter(
    tags=["Fasilitas"]
)

# =======================
# Create Fasilitas
# =======================
@router.post("/", response_model=schemas.FasilitasResponse)
def create_fasilitas(fasilitas: schemas.FasilitasCreate, db: Session = Depends(get_db)):
    new_fasilitas = models.Fasilitas(nama_fasilitas=fasilitas.nama_fasilitas)
    db.add(new_fasilitas)
    db.commit()
    db.refresh(new_fasilitas)
    return new_fasilitas

# =======================
# Get All Fasilitas
# =======================
@router.get("/", response_model=List[schemas.FasilitasResponse])
def get_all_fasilitas(db: Session = Depends(get_db)):
    fasilitas_list = db.query(models.Fasilitas).all()
    return fasilitas_list

# =======================
# Get Fasilitas by ID
# =======================
@router.get("/{fasilitas_id}", response_model=schemas.FasilitasResponse)
def get_fasilitas(fasilitas_id: int, db: Session = Depends(get_db)):
    fasilitas = db.query(models.Fasilitas).filter(models.Fasilitas.id_fasilitas == fasilitas_id).first()
    if not fasilitas:
        raise HTTPException(status_code=404, detail="Fasilitas tidak ditemukan")
    return fasilitas

# =======================
# Update Fasilitas
# =======================
@router.put("/{fasilitas_id}", response_model=schemas.FasilitasResponse)
def update_fasilitas(fasilitas_id: int, fasilitas_data: schemas.FasilitasCreate, db: Session = Depends(get_db)):
    fasilitas = db.query(models.Fasilitas).filter(models.Fasilitas.id_fasilitas == fasilitas_id).first()
    if not fasilitas:
        raise HTTPException(status_code=404, detail="Fasilitas tidak ditemukan")
    
    fasilitas.nama_fasilitas = fasilitas_data.nama_fasilitas
    db.commit()
    db.refresh(fasilitas)
    return fasilitas

# =======================
# Delete Fasilitas
# =======================
@router.delete("/{fasilitas_id}", response_model=dict)
def delete_fasilitas(fasilitas_id: int, db: Session = Depends(get_db)):
    fasilitas = db.query(models.Fasilitas).filter(models.Fasilitas.id_fasilitas == fasilitas_id).first()
    if not fasilitas:
        raise HTTPException(status_code=404, detail="Fasilitas tidak ditemukan")
    
    db.delete(fasilitas)
    db.commit()
    return {"message": "Fasilitas berhasil dihapus"}
