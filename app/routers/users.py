from hashlib import md5
from fastapi import APIRouter, HTTPException, Depends
from sqlalchemy.orm import Session
from app import models, schemas
from app.database import get_db

router = APIRouter()

@router.post("/", response_model=schemas.UserResponse)
def create_user(user: schemas.UserCreate, db: Session = Depends(get_db)):
    db_user = db.query(models.User).filter(models.User.email == user.email).first()
    if db_user:
        raise HTTPException(status_code=400, detail="Email sudah terdaftar")
    
    hashed_password = md5(user.password.encode()).hexdigest()
    new_user = models.User(
        nama=user.nama,
        email=user.email,
        password=hashed_password,
        role=user.role
    )
    db.add(new_user)
    db.commit()
    db.refresh(new_user)
    return new_user

@router.post("/login", response_model=schemas.UserResponse)
def login(user: schemas.UserLogin, db: Session = Depends(get_db)):
    hashed_password = md5(user.password.encode()).hexdigest()
    db_user = db.query(models.User).filter((models.User.email == user.email) & (models.User.password == hashed_password)).first()
    if not db_user:
        raise HTTPException(status_code=404, detail="Email atau Password Salah")
    return db_user

@router.get("/{user_id}", response_model=schemas.UserResponse)
def read_user(user_id: int, db: Session = Depends(get_db)):
    user = db.query(models.User).filter(models.User.id_user == user_id).first()
    if not user:
        raise HTTPException(status_code=404, detail="User tidak ditemukan")
    return user

@router.put("/{user_id}/guide-status", response_model=schemas.UserResponse)
def update_guide_status(user_id: int, payload: schemas.UpdateGuideStatus, db: Session = Depends(get_db)):
    user = db.query(models.User).filter(models.User.id_user == user_id).first()
    if not user:
        raise HTTPException(status_code=404, detail="User tidak ditemukan")

    user.has_seen_guide = payload.has_seen_guide
    db.commit()
    db.refresh(user)
    return user