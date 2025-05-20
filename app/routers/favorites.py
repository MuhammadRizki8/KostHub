from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from app.database import get_db
from app import models, schemas
router = APIRouter()

# =======================
# Add Favorite
# =======================
@router.post("/", response_model=dict)
def add_favorite(payload: schemas.FavoriteRequest, db: Session = Depends(get_db)):
    existing = db.query(models.Favorites).filter_by(id_pencari=payload.id_user, id_kost=payload.id_kost).first()
    if existing:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={"error": "AlreadyExists", "message": "Favorite already exists"}
        )

    new_fav = models.Favorites(id_pencari=payload.id_user, id_kost=payload.id_kost)
    db.add(new_fav)
    db.commit()
    db.refresh(new_fav)
    return {"message": "Favorite added successfully"}

# =======================
# Get Favorites by User
# =======================
@router.get("/user/{id_user}", response_model=dict)
def get_favorites_by_user(id_user: int, db: Session = Depends(get_db)):
    favs = (
        db.query(models.Favorites)
        .filter_by(id_pencari=id_user)
        .join(models.Kost)
        .all()
    )
    print(favs)

    kost_list = [
        {
            "id_kost": fav.kost.id_kost,
            "nama_kost": fav.kost.nama_kost,
            "alamat": fav.kost.alamat,
            "harga_sewa": float(fav.kost.harga_sewa),
            "luas": fav.kost.luas,
            "fasilitas": [f.nama_fasilitas for f in fav.kost.fasilitas]
        } for fav in favs
    ]

    return {"message": "Favorites retrieved", "data": kost_list}

# =======================
# Remove Favorite
# =======================
@router.delete("/", response_model=dict)
def remove_favorite(payload: schemas.FavoriteRequest, db: Session = Depends(get_db)):
    fav = db.query(models.Favorites).filter_by(id_pencari=payload.id_user, id_kost=payload.id_kost).first()
    if not fav:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail={"error": "NotFound", "message": "Favorite not found"}
        )

    db.delete(fav)
    db.commit()
    return {"message": "Favorite removed successfully"}
