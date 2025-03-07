from pydantic import BaseModel, EmailStr

# Schema untuk User
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

# Schema untuk Kost
class KostBase(BaseModel):
    nama_kost: str
    alamat: str
    deskripsi: str
    harga_sewa: float
    luas: str

class KostCreate(KostBase):
    id_pemilik: int

class KostResponse(KostBase):
    id_kost: int
    id_pemilik: int

    class Config:
        orm_mode = True
