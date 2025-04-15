from io import BytesIO
from fastapi import APIRouter, UploadFile, File, HTTPException, Depends
from sqlalchemy.orm import Session
import json
import pandas as pd
import re
from app.database import get_db
from app import models
from app.models import StatusPropertiEnum, JenisSertifikatEnum

router = APIRouter(
    prefix="/upload",
    tags=["Upload"]
)

def extract_panjang_lebar_luas(fasilitas_str: str):
    fasilitas_str = fasilitas_str.lower()
    match = re.search(r"(\d+(?:\.\d+)?)\s*[x×]\s*(\d+(?:\.\d+)?)", fasilitas_str)
    if match:
        try:
            panjang = float(match.group(1))
            lebar = float(match.group(2))
            return panjang, lebar, panjang * lebar
        except ValueError:
            pass
    return None, None, None

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

            status = properties.get("Status Properti", "Sewa")
            sertifikat = properties.get("Jenis Sertifikat", "Sertifikat Hak Milik (SHM)")

            if status not in StatusPropertiEnum._value2member_map_:
                raise HTTPException(status_code=400, detail=f"Invalid status properti: {status}")
            if sertifikat not in JenisSertifikatEnum._value2member_map_:
                raise HTTPException(status_code=400, detail=f"Invalid jenis sertifikat: {sertifikat}")

            kost = models.Kost(
                nama_kost=properties.get("Nama Properti", "Unnamed"),
                alamat=properties.get("Alamat Lengkap", ""),
                deskripsi=status,
                harga_sewa=properties.get("Harga Properti", 0),
                luas=properties.get("Luas Bangunan (m²)", 0),
                luas_tanah=properties.get("Luas Tanah (m²)", 0),
                jenis_sertifikat=sertifikat,
                longitude=geometry.get("coordinates", [0, 0])[0],
                latitude=geometry.get("coordinates", [0, 0])[1],
                status_properti=status
            )
            db.add(kost)
            db.commit()
            db.refresh(kost)

            fasilitas_list = properties.get("Fasilitas", "").split("\n")
            for nama_fasilitas in fasilitas_list:
                nama_fasilitas = nama_fasilitas.strip()
                if not nama_fasilitas:
                    continue

                fasilitas = db.query(models.Fasilitas).filter_by(nama_fasilitas=nama_fasilitas).first()
                if not fasilitas:
                    fasilitas = models.Fasilitas(nama_fasilitas=nama_fasilitas)
                    db.add(fasilitas)
                    db.commit()
                    db.refresh(fasilitas)

                kost_fasilitas = models.KostFasilitas(id_kost=kost.id_kost, id_fasilitas=fasilitas.id_fasilitas)
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
        contents = await file.read()
        df = pd.read_excel(BytesIO(contents))

        for _, row in df.iterrows():
            nama_properti = str(row.get("Nama Properti", "Unnamed"))
            alamat = str(row.get("Alamat", ""))
            harga = int(row.get("Harga Properti", 0))
            latitude = float(row.get("latitude", 0.0))
            longitude = float(row.get("longitude", 0.0))
            fasilitas_raw = str(row.get("Fasilitas", ""))
            gambar_raw = str(row.get("gambar", ""))

            panjang, lebar, luas = None, None, None
            fasilitas_list = []

            for item in fasilitas_raw.split(","):
                item = item.strip()
                if not item:
                    continue
                p, l, luas_item = extract_panjang_lebar_luas(item)
                if p and l:
                    panjang, lebar, luas = p, l, luas_item
                else:
                    fasilitas_list.append(item)
            
            # Hapus duplikat sambil menjaga urutan
            fasilitas_list = list(dict.fromkeys(fasilitas_list))

            kost = models.Kost(
                nama_kost=nama_properti,
                alamat=alamat,
                harga_sewa=harga,
                latitude=latitude,
                longitude=longitude,
                luas=luas or 0,
                panjang=panjang or 0,
                lebar=lebar or 0,
                luas_tanah=luas or 0,
                status_properti="Sewa",
                jenis_sertifikat="Sertifikat Hak Milik (SHM)"
            )
            db.add(kost)
            db.commit()
            db.refresh(kost)

            for nama_fasilitas in fasilitas_list:
                fasilitas = db.query(models.Fasilitas).filter_by(nama_fasilitas=nama_fasilitas).first()
                if not fasilitas:
                    fasilitas = models.Fasilitas(nama_fasilitas=nama_fasilitas)
                    db.add(fasilitas)
                    db.commit()
                    db.refresh(fasilitas)

                if not db.query(models.KostFasilitas).filter_by(id_kost=kost.id_kost, id_fasilitas=fasilitas.id_fasilitas).first():
                    db.add(models.KostFasilitas(id_kost=kost.id_kost, id_fasilitas=fasilitas.id_fasilitas))

            for url in gambar_raw.split(","):
                url = url.strip()
                if url:
                    db.add(models.GambarKost(id_kost=kost.id_kost, url_gambar=url))

            db.commit()

        return {"message": "Excel uploaded and processed successfully"}

    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error processing file: {str(e)}")
