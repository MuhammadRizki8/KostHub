from fastapi import APIRouter, HTTPException, Depends, Query
from sqlalchemy.orm import Session
from app import models, schemas
from app.database import get_db
from typing import List
from sqlalchemy.orm import joinedload
router = APIRouter(
    tags=["Kost"]
)

# =======================
# Create Kost
# =======================
@router.post("/", response_model=schemas.KostResponse)
def create_kost(kost: schemas.KostCreate, db: Session = Depends(get_db)):
    # 1. Buat objek Kost baru
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
    db.commit()
    db.refresh(new_kost)

    # 2. Validasi fasilitas & simpan relasi di tabel kost_fasilitas
    fasilitas_list = db.query(models.Fasilitas).filter(models.Fasilitas.id_fasilitas.in_(kost.fasilitas)).all()
    
    if len(fasilitas_list) != len(kost.fasilitas):
        raise HTTPException(status_code=400, detail="Satu atau lebih fasilitas tidak ditemukan")

    for fasilitas in fasilitas_list:
        kost_fasilitas = models.KostFasilitas(id_kost=new_kost.id_kost, id_fasilitas=fasilitas.id_fasilitas)
        db.add(kost_fasilitas)

    db.commit()

    # 3. Simpan gambar kost jika ada
    gambar_list = []
    for url in kost.gambar:  # `kost.gambar` adalah list URL gambar
        gambar_kost = models.GambarKost(id_kost=new_kost.id_kost, url_gambar=url)
        db.add(gambar_kost)
        gambar_list.append(gambar_kost)  # Simpan untuk dikembalikan dalam response

    db.commit()

    # 4. Ambil ulang data kost termasuk fasilitas dan gambar
    kost_with_details = db.query(models.Kost).filter(models.Kost.id_kost == new_kost.id_kost).first()
    
    # Tambahkan gambar ke dalam response
    kost_with_details.gambar_kosts = gambar_list

    return kost_with_details


# =======================
# Get Kost by ID
# =======================
@router.get("/{kost_id}", response_model=schemas.KostResponse)
def read_kost(kost_id: int, db: Session = Depends(get_db)):
    kost = (
        db.query(models.Kost)
        .filter(models.Kost.id_kost == kost_id)
        .options(joinedload(models.Kost.gambar_kost))
        .first()
    )

    if not kost:
        raise HTTPException(status_code=404, detail="Kost tidak ditemukan")

    print(f"Gambar kost: {kost.gambar_kost}")  # Debugging

    return kost


# =======================
# Get All Kost (dengan filter & sorting)
# =======================
@router.get("/", response_model=List[schemas.KostResponse])
def get_all_kost(
    skip: int = Query(0, description="Jumlah data yang dilewati untuk pagination"),
    limit: int = Query(10, description="Jumlah maksimum kost yang ditampilkan"),
    db: Session = Depends(get_db)
):
    kost_list = (
        db.query(models.Kost)
        .options(joinedload(models.Kost.gambar_kost))  # Mengambil semua gambar terkait
        .order_by(models.Kost.id_kost.desc())  # Sorting dari terbaru
        .offset(skip)
        .limit(limit)
        .all()
    )
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

    for kost in kost_list:
        # 1. Buat objek Kost baru
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
        db.commit()
        db.refresh(new_kost)

        # 2. Validasi & Simpan fasilitas
        fasilitas_list = db.query(models.Fasilitas).filter(models.Fasilitas.id_fasilitas.in_(kost.fasilitas)).all()
        if len(fasilitas_list) != len(kost.fasilitas):
            raise HTTPException(status_code=400, detail="Satu atau lebih fasilitas tidak ditemukan")

        for fasilitas in fasilitas_list:
            kost_fasilitas = models.KostFasilitas(id_kost=new_kost.id_kost, id_fasilitas=fasilitas.id_fasilitas)
            db.add(kost_fasilitas)

        # 3. Simpan gambar kost jika ada
        for url in kost.gambar:
            gambar_kost = models.GambarKost(id_kost=new_kost.id_kost, url_gambar=url)
            db.add(gambar_kost)

        db.commit()

        # 4. Ambil ulang data kost termasuk fasilitas dan gambar
        kost_with_details = (
            db.query(models.Kost)
            .filter(models.Kost.id_kost == new_kost.id_kost)
            .options(joinedload(models.Kost.gambar_kost), joinedload(models.Kost.fasilitas))
            .first()
        )

        new_kost_list.append(kost_with_details)

    return new_kost_list

# =======================
# Tambah Gambar Kost
# =======================
@router.post("/{kost_id}/gambar", response_model=dict)
def add_gambar_kost(kost_id: int, gambar: schemas.GambarCreate, db: Session = Depends(get_db)):
    kost = db.query(models.Kost).filter(models.Kost.id_kost == kost_id).first()

    if not kost:
        raise HTTPException(status_code=404, detail="Kost tidak ditemukan")

    new_gambar = models.GambarKost(id_kost=kost_id, url_gambar=gambar.url_gambar)
    db.add(new_gambar)
    db.commit()

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

    db.delete(gambar)
    db.commit()

    return {"message": "Gambar berhasil dihapus"}