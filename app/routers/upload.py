from fastapi import APIRouter, UploadFile, File, HTTPException, Depends
from sqlalchemy.orm import Session
import json
from app.database import get_db
from app import models, schemas
from app.models import StatusPropertiEnum, JenisSertifikatEnum

router = APIRouter(
    prefix="/upload",
    tags=["Upload"]
)

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