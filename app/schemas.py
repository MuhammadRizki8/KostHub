from pydantic import BaseModel, EmailStr
from typing import List, Optional


# =======================
# Schema untuk User
# =======================
class UserBase(BaseModel):
    nama: str
    email: EmailStr


class UserCreate(UserBase):
    password: str
    role: str  # 'pemilik' atau 'pencari'


class UserResponse(UserBase):
    id_user: int
    role: str

    class Config:
        orm_mode = True


# =======================
# Schema untuk Gambar Kost
# =======================
class GambarKostResponse(BaseModel):
    id_gambar: int
    url_gambar: str

    class Config:
        orm_mode = True


# =======================
# Schema untuk Fasilitas
# =======================
class FasilitasResponse(BaseModel):
    id_fasilitas: int
    nama_fasilitas: str

    class Config:
        orm_mode = True


# =======================
# Schema untuk Kost
# =======================
class KostBase(BaseModel):
    nama_kost: str
    alamat: str
    deskripsi: str
    harga_sewa: float
    luas: int 


class KostCreate(KostBase):
    id_pemilik: int


class KostResponse(KostBase):
    id_kost: int
    id_pemilik: int
    gambar: List[GambarKostResponse] = []
    fasilitas: List[FasilitasResponse] = []

    class Config:
        orm_mode = True
