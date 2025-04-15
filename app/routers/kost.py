from fastapi import APIRouter, HTTPException, Depends, Query, Body, status
from sqlalchemy.orm import Session, joinedload
from app import models, schemas
from app.database import get_db
from typing import List, Optional
import math

router = APIRouter(tags=["Kost"])

# =======================
# Create Kost
# =======================
@router.post("/", response_model=dict)
def create_kost(kost: schemas.KostCreate, db: Session = Depends(get_db)):
    try:
        new_kost = models.Kost(
            nama_kost=kost.nama_kost,
            alamat=kost.alamat,
            deskripsi=kost.deskripsi,
            harga_sewa=kost.harga_sewa,
            luas=kost.luas,
            panjang=kost.panjang,
            lebar=kost.lebar,
            luas_tanah=kost.luas_tanah,
            status_properti=kost.status_properti,
            jenis_sertifikat=kost.jenis_sertifikat,
            longitude=kost.longitude,
            latitude=kost.latitude
        )
        db.add(new_kost)
        db.flush()

        facilities_in_db = db.query(models.Fasilitas).filter(
            models.Fasilitas.id_fasilitas.in_(kost.fasilitas)
        ).all()
        if len(facilities_in_db) != len(kost.fasilitas):
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail={
                    "error": "InvalidFacilities",
                    "message": "One or more facilities were not found in the database."
                }
            )

        for facility in facilities_in_db:
            db.add(models.KostFasilitas(id_kost=new_kost.id_kost, id_fasilitas=facility.id_fasilitas))

        gambar_objs = []
        for url in kost.gambar:
            gambar = models.GambarKost(id_kost=new_kost.id_kost, url_gambar=url)
            db.add(gambar)
            gambar_objs.append(gambar)

        db.commit()
        db.refresh(new_kost)
        new_kost.gambar_kost = gambar_objs
        new_kost.fasilitas = facilities_in_db 

        kost_response = schemas.KostResponse.from_orm(new_kost)
        return {
            "message": "Kost created successfully.",
            "data": kost_response
        }

    except HTTPException as http_ex:
        raise http_ex

    except Exception as e:
        db.rollback()
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail={
                "error": "ServerError",
                "message": f"An unexpected error occurred: {str(e)}"
            }
        )

# =======================
# Get Kost by ID
# =======================
@router.get("/{kost_id}", response_model=dict)
def read_kost(kost_id: int, db: Session = Depends(get_db)):
    try:
        kost = (
            db.query(models.Kost)
            .filter(models.Kost.id_kost == kost_id)
            .options(
                joinedload(models.Kost.gambar_kost),
                joinedload(models.Kost.fasilitas)
            )
            .first()
        )

        if not kost:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={
                    "error": "NotFound",
                    "message": "Kost not found"
                }
            )

        kost_response = schemas.KostResponse.from_orm(kost)
        return {
            "message": "Kost retrieved successfully.",
            "data": kost_response
        }

    except HTTPException as http_ex:
        raise http_ex

    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail={
                "error": "ServerError",
                "message": f"An unexpected server error occurred: {str(e)}"
            }
        )

# =======================
# Get All Kosts (with filtering, sorting, search, and fetch_all option)
# =======================
@router.get("/", response_model=dict)
def get_all_kosts(
    skip: int = Query(0, description="Number of records to skip for pagination"),
    limit: int = Query(10, description="Maximum number of records to return"),
    search: Optional[str] = Query(None, description="Search by kost name or address"),
    fetch_all: bool = Query(False, description="Set to true to fetch all kost data without pagination"),
    db: Session = Depends(get_db)
):
    try:
        query = db.query(models.Kost).options(joinedload(models.Kost.gambar_kost))

        if search:
            search_term = f"%{search}%"
            query = query.filter(
                models.Kost.nama_kost.ilike(search_term) |
                models.Kost.alamat.ilike(search_term)
            )

        # Always order first
        query = query.order_by(models.Kost.id_kost.desc())

        # Apply pagination only if fetch_all is False
        if not fetch_all:
            query = query.offset(skip).limit(limit)

        kost_list = query.all()
        kost_response = [schemas.KostResponse.from_orm(kost) for kost in kost_list]

        return {
            "message": "Kost list retrieved successfully.",
            "data": kost_response,
            "meta": {
                "fetched_all": fetch_all,
                "count": len(kost_response)
            }
        }

    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail={
                "error": "ServerError",
                "message": f"An unexpected error occurred: {str(e)}"
            }
        )

# =======================
# Update Kost
# =======================
@router.put("/{kost_id}", response_model=dict)
def update_kost(
    kost_id: int, 
    kost_update: schemas.KostUpdate, 
    db: Session = Depends(get_db)
):
    try:
        # Find the kost by ID
        kost = db.query(models.Kost).filter(models.Kost.id_kost == kost_id).first()
        if not kost:
            raise HTTPException(status_code=404, detail="Kost not found.")

        # Update fields if provided
        for key, value in kost_update.dict(exclude_unset=True).items():
            setattr(kost, key, value)

        # Commit the changes
        db.commit()
        db.refresh(kost)

        return {
            "message": "Kost updated successfully.",
            "data": kost
        }

    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail={
                "error": "ServerError",
                "message": f"An unexpected error occurred: {str(e)}"
            }
        )


# =======================
# Delete Kost
# =======================
@router.delete("/{kost_id}", response_model=dict)
def delete_kost(kost_id: int, db: Session = Depends(get_db)):
    try:
        # Find the kost by ID
        kost = db.query(models.Kost).filter(models.Kost.id_kost == kost_id).first()
        if not kost:
            raise HTTPException(status_code=404, detail="Kost not found.")
        
        # Delete the kost
        db.delete(kost)
        db.commit()

        return {
            "message": "Kost deleted successfully."
        }

    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail={
                "error": "ServerError",
                "message": f"An unexpected error occurred: {str(e)}"
            }
        )

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
