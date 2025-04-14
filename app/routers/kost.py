from fastapi import APIRouter, HTTPException, Depends, Query, Body
from sqlalchemy.orm import Session, joinedload
from app import models, schemas
from app.database import get_db
from typing import List, Optional
import math

router = APIRouter(tags=["Kost"])

# =======================
# Create Kost
# =======================
@router.post("/", response_model=schemas.KostResponse)
def create_kost(kost: schemas.KostCreate, db: Session = Depends(get_db)):
    try:
        # 1. Buat objek Kost baru dan flush untuk mendapatkan id
        new_kost = models.Kost(
            nama_kost=kost.nama_kost,
            alamat=kost.alamat,
            deskripsi=kost.deskripsi,
            harga_sewa=kost.harga_sewa,
            luas=kost.luas,
            luas_tanah=kost.luas_tanah,
            status_properti=kost.status_properti,
            jenis_sertifikat=kost.jenis_sertifikat,
            longitude=kost.longitude,
            latitude=kost.latitude
        )
        db.add(new_kost)
        db.flush()  # mendapatkan new_kost.id_kost tanpa commit

        # 2. Validasi fasilitas & simpan relasi di tabel kost_fasilitas
        fasilitas_list = db.query(models.Fasilitas).filter(
            models.Fasilitas.id_fasilitas.in_(kost.fasilitas)
        ).all()
        if len(fasilitas_list) != len(kost.fasilitas):
            raise HTTPException(status_code=400, detail="Satu atau lebih fasilitas tidak ditemukan")
        for fasilitas in fasilitas_list:
            db.add(models.KostFasilitas(id_kost=new_kost.id_kost, id_fasilitas=fasilitas.id_fasilitas))

        # 3. Simpan gambar kost jika ada
        gambar_list = []
        for url in kost.gambar:  # kost.gambar merupakan list URL
            gambar = models.GambarKost(id_kost=new_kost.id_kost, url_gambar=url)
            db.add(gambar)
            gambar_list.append(gambar)

        db.commit()
        db.refresh(new_kost)
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    
    # Menambahkan gambar ke properti response (jika perlu)
    new_kost.gambar_kosts = gambar_list
    return new_kost

# =======================
# Get Kost by ID
# =======================
@router.get("/{kost_id}", response_model=schemas.KostResponse)
def read_kost(kost_id: int, db: Session = Depends(get_db)):
    kost = (
        db.query(models.Kost)
        .filter(models.Kost.id_kost == kost_id)
        .options(joinedload(models.Kost.gambar_kost), joinedload(models.Kost.fasilitas))
        .first()
    )
    if not kost:
        raise HTTPException(status_code=404, detail="Kost tidak ditemukan")
    return kost

# =======================
# Get All Kost (dengan filter, sorting, dan pencarian)
# =======================
@router.get("/", response_model=List[schemas.KostResponse])
def get_all_kost(
    skip: int = Query(0, description="Jumlah data yang dilewati untuk pagination"),
    limit: int = Query(10, description="Jumlah maksimum kost yang ditampilkan"),
    search: Optional[str] = Query(None, description="Cari berdasarkan nama atau alamat"),
    db: Session = Depends(get_db)
):
    query = db.query(models.Kost).options(joinedload(models.Kost.gambar_kost))
    if search:
        search_term = f"%{search}%"
        query = query.filter(
            models.Kost.nama_kost.ilike(search_term) |
            models.Kost.alamat.ilike(search_term)
        )
    kost_list = query.order_by(models.Kost.id_kost.desc()).offset(skip).limit(limit).all()
    return kost_list

# =======================
# Update Kost
# =======================
@router.put("/{kost_id}", response_model=schemas.KostResponse)
def update_kost(kost_id: int, kost_update: schemas.KostUpdate, db: Session = Depends(get_db)):
    kost = db.query(models.Kost).filter(models.Kost.id_kost == kost_id).first()
    if not kost:
        raise HTTPException(status_code=404, detail="Kost tidak ditemukan")
    
    for key, value in kost_update.dict(exclude_unset=True).items():
        setattr(kost, key, value)
    db.commit()
    db.refresh(kost)
    return kost

# =======================
# Delete Kost
# =======================
@router.delete("/{kost_id}", response_model=dict)
def delete_kost(kost_id: int, db: Session = Depends(get_db)):
    kost = db.query(models.Kost).filter(models.Kost.id_kost == kost_id).first()
    if not kost:
        raise HTTPException(status_code=404, detail="Kost tidak ditemukan")
    db.delete(kost)
    db.commit()
    return {"message": "Kost berhasil dihapus"}

# =======================
# Import Batch Kost
# =======================
@router.post("/import", response_model=List[schemas.KostResponse])
def import_batch_kost(kost_list: List[schemas.KostCreate], db: Session = Depends(get_db)):
    new_kost_list = []
    try:
        for kost in kost_list:
            new_kost = models.Kost(
                nama_kost=kost.nama_kost,
                alamat=kost.alamat,
                deskripsi=kost.deskripsi,
                harga_sewa=kost.harga_sewa,
                luas=kost.luas,
                luas_tanah=kost.luas_tanah,
                status_properti=kost.status_properti,
                jenis_sertifikat=kost.jenis_sertifikat,
                longitude=kost.longitude,
                latitude=kost.latitude
            )
            db.add(new_kost)
            db.flush()

            fasilitas_list = db.query(models.Fasilitas).filter(
                models.Fasilitas.id_fasilitas.in_(kost.fasilitas)
            ).all()
            if len(fasilitas_list) != len(kost.fasilitas):
                raise HTTPException(status_code=400, detail="Satu atau lebih fasilitas tidak ditemukan")
            for fasilitas in fasilitas_list:
                db.add(models.KostFasilitas(id_kost=new_kost.id_kost, id_fasilitas=fasilitas.id_fasilitas))
            for url in kost.gambar:
                db.add(models.GambarKost(id_kost=new_kost.id_kost, url_gambar=url))
            db.commit()
            db.refresh(new_kost)
            new_kost_list.append(new_kost)
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    return new_kost_list

# =======================
# Tambah Gambar Kost
# =======================
@router.post("/{kost_id}/gambar", response_model=dict)
def add_gambar_kost(kost_id: int, gambar: schemas.GambarCreate, db: Session = Depends(get_db)):
    kost = db.query(models.Kost).filter(models.Kost.id_kost == kost_id).first()
    if not kost:
        raise HTTPException(status_code=404, detail="Kost tidak ditemukan")
    try:
        new_gambar = models.GambarKost(id_kost=kost_id, url_gambar=gambar.url_gambar)
        db.add(new_gambar)
        db.commit()
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    return {"message": "Gambar berhasil ditambahkan", "url_gambar": new_gambar.url_gambar}

# =======================
# Hapus Gambar Kost
# =======================
@router.delete("/{kost_id}/gambar/{gambar_id}", response_model=dict)
def delete_gambar_kost(kost_id: int, gambar_id: int, db: Session = Depends(get_db)):
    gambar = db.query(models.GambarKost).filter(
        models.GambarKost.id_kost == kost_id,
        models.GambarKost.id_gambar == gambar_id
    ).first()
    if not gambar:
        raise HTTPException(status_code=404, detail="Gambar tidak ditemukan")
    try:
        db.delete(gambar)
        db.commit()
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=500, detail=str(e))
    return {"message": "Gambar berhasil dihapus"}

# =======================
# Cari Kost Berdasarkan Lokasi (Radius Search)
# =======================
@router.get("/search/nearby", response_model=List[schemas.KostResponse])
def search_nearby(
    latitude: float = Query(..., description="Latitude pusat pencarian"),
    longitude: float = Query(..., description="Longitude pusat pencarian"),
    radius: float = Query(5.0, description="Radius pencarian dalam kilometer"),
    db: Session = Depends(get_db)
):
    # Fungsi menghitung jarak antar dua koordinat menggunakan rumus Haversine
    def haversine(lat1, lon1, lat2, lon2):
        R = 6371  # Radius bumi dalam km
        dlat = math.radians(lat2 - lat1)
        dlon = math.radians(lon2 - lon1)
        a = math.sin(dlat / 2) ** 2 + math.cos(math.radians(lat1)) * math.cos(math.radians(lat2)) * math.sin(dlon / 2) ** 2
        c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))
        return R * c

    all_kost = db.query(models.Kost).options(joinedload(models.Kost.gambar_kost)).all()
    nearby_kost = []
    for kost in all_kost:
        distance = haversine(latitude, longitude, kost.latitude, kost.longitude)
        if distance <= radius:
            nearby_kost.append(kost)
    return nearby_kost
# =======================
# total kost di database
# =======================
@router.get("/total", tags=["Kost"])
def get_total_kost(db: Session = Depends(get_db)):
    total_kost = db.query(models.Kost).count()
    return {"total_kost": total_kost}
