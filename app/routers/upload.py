from io import BytesIO
from fastapi import APIRouter, UploadFile, File, HTTPException, Depends
from sqlalchemy.orm import Session
import json
from app.database import get_db
from app import models, schemas
from app.models import StatusPropertiEnum, JenisSertifikatEnum
import pandas as pd
import re

router = APIRouter(
    prefix="/upload",
    tags=["Upload"]
)

def extract_luas_from_fasilitas(fasilitas_str: str) -> int:
    """
    Ekstrak ukuran dari string fasilitas, misalnya:
    - "3 x 3 meter"
    - "3x3m"
    - "Ukuran 3×3 meter"
    """
    # Normalisasi ke huruf kecil & hapus spasi ekstra
    fasilitas_str = fasilitas_str.lower().strip()

    # Cari pola "angka x angka"
    match = re.search(r"(\d+)\s*[x×]\s*(\d+)", fasilitas_str)
    if match:
        try:
            panjang = int(match.group(1))
            lebar = int(match.group(2))
            return panjang * lebar
        except:
            return 0
    return 0

@router.post("/geojson/")
def upload_geojson(file: UploadFile = File(...), db: Session = Depends(get_db)):
    if not file.filename.endswith(".geojson"):
        raise HTTPException(status_code=400, detail="Invalid file format. Please upload a .geojson file.")
    
    try:
        contents = file.file.read().decode("utf-8")
        data = json.loads(contents)
        
        if "features" not in data:
            raise HTTPException(status_code=400, detail="Invalid GeoJSON structure.")
        
        for feature in data["features"]:
            geometry = feature.get("geometry", {})
            properties = feature.get("properties", {})
            
            status_properti = properties.get("Status Properti", "Sewa")
            jenis_sertifikat = properties.get("Jenis Sertifikat", "Sertifikat Hak Milik (SHM)")
            
            if status_properti not in StatusPropertiEnum._value2member_map_:
                raise HTTPException(status_code=400, detail=f"Invalid status properti: {status_properti}")
            
            if jenis_sertifikat not in JenisSertifikatEnum._value2member_map_:
                raise HTTPException(status_code=400, detail=f"Invalid jenis sertifikat: {jenis_sertifikat}")
            
            new_kost = models.Kost(
                nama_kost=properties.get("Nama Properti", "Unnamed"),
                alamat=properties.get("Alamat Lengkap", ""),
                deskripsi=properties.get("Status Properti", ""),
                harga_sewa=properties.get("Harga Properti", 0),
                luas=properties.get("Luas Bangunan (m²)", 0),
                luas_tanah=properties.get("Luas Tanah (m²)", 0),
                jenis_sertifikat=jenis_sertifikat,
                longitude=geometry.get("coordinates", [0, 0])[0],
                latitude=geometry.get("coordinates", [0, 0])[1],
                status_properti=status_properti
            )
            db.add(new_kost)
            db.commit()
            db.refresh(new_kost)

            fasilitas_list = properties.get("Fasilitas", "").split("\n")
            for fasilitas_nama in fasilitas_list:
                fasilitas_nama = fasilitas_nama.strip()
                if not fasilitas_nama:
                    continue
                
                fasilitas = db.query(models.Fasilitas).filter(models.Fasilitas.nama_fasilitas == fasilitas_nama).first()
                if not fasilitas:
                    fasilitas = models.Fasilitas(nama_fasilitas=fasilitas_nama)
                    db.add(fasilitas)
                    db.commit()
                    db.refresh(fasilitas)
                
                kost_fasilitas = models.KostFasilitas(id_kost=new_kost.id_kost, id_fasilitas=fasilitas.id_fasilitas)
                db.add(kost_fasilitas)
            
            db.commit()
        
        return {"message": "GeoJSON uploaded and processed successfully"}
    
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error processing file: {str(e)}")
    
@router.post("/excel/")
async def upload_excel(file: UploadFile = File(...), db: Session = Depends(get_db)):
    if not file.filename.endswith(".xlsx"):
        raise HTTPException(status_code=400, detail="Invalid file format. Please upload a .xlsx file.")
    
    try:
        # Baca Excel file ke DataFrame
        contents = await file.read()
        excel_data = BytesIO(contents)
        df = pd.read_excel(excel_data)

        for _, row in df.iterrows():
            nama_properti = str(row.get("Nama Properti", "Unnamed"))
            alamat = str(row.get("Alamat", ""))
            harga = int(row.get("Harga Properti", 0))
            latitude = float(row.get("latitude", 0.0))
            longitude = float(row.get("longitude", 0.0))
            
            fasilitas_raw = str(row.get("Fasilitas", ""))
            luas = extract_luas_from_fasilitas(fasilitas_raw)


            # Simpan data kost
            new_kost = models.Kost(
                nama_kost=nama_properti,
                alamat=alamat,
                harga_sewa=harga,
                latitude=latitude,
                longitude=longitude,
                luas=luas,
                luas_tanah=luas,
                status_properti="Sewa",  # default
                jenis_sertifikat="Sertifikat Hak Milik (SHM)"  # default
            )
            db.add(new_kost)
            db.commit()
            db.refresh(new_kost)

            # Fasilitas (dipisah koma)
            fasilitas_list = set(map(lambda x: x.strip(), str(row.get("Fasilitas", "")).split(",")))
            for fasilitas_nama in fasilitas_list:
                if not fasilitas_nama:
                    continue

                fasilitas = db.query(models.Fasilitas).filter_by(nama_fasilitas=fasilitas_nama).first()
                if not fasilitas:
                    fasilitas = models.Fasilitas(nama_fasilitas=fasilitas_nama)
                    db.add(fasilitas)
                    db.commit()
                    db.refresh(fasilitas)

                kost_fasilitas = db.query(models.KostFasilitas).filter_by(
                    id_kost=new_kost.id_kost, id_fasilitas=fasilitas.id_fasilitas
                ).first()

                if not kost_fasilitas:
                    kost_fasilitas = models.KostFasilitas(id_kost=new_kost.id_kost, id_fasilitas=fasilitas.id_fasilitas)
                    db.add(kost_fasilitas)

            # Gambar (dipisah koma)
            gambar_list = str(row.get("gambar", "")).split(",")
            for gambar_url in gambar_list:
                gambar_url = gambar_url.strip()
                if not gambar_url:
                    continue

                gambar = models.GambarKost(id_kost=new_kost.id_kost, url_gambar=gambar_url)
                db.add(gambar)

            db.commit()

        return {"message": "Excel uploaded and processed successfully"}
    
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error processing file: {str(e)}")