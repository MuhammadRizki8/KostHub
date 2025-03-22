from pydantic import BaseModel, EmailStr, condecimal, conint
from typing import List, Optional
from enum import Enum

# =======================
# Enum untuk Status Properti
# =======================
class StatusPropertiEnum(str, Enum):
    SEWA = "Sewa"
    JUAL = "Jual"

# =======================
# Enum untuk Jenis Sertifikat
# =======================
class JenisSertifikatEnum(str, Enum):
    SHM = "Sertifikat Hak Milik (SHM)"
    SHGB = "Sertifikat Hak Guna Bangunan (SHGB)"
    SHGU = "Sertifikat Hak Guna Usaha (SHGU)"
    HPL = "Sertifikat Hak Pengelolaan (HPL)"
    SHS = "Sertifikat Hak Sewa (SHS)"
    SHP = "Sertifikat Hak Pakai (SHP)"
    SHM_ADAT = "Sertifikat Hak Masyarakat Adat (SHM Adat)"

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
        from_attributes = True

# =======================
# Schema untuk Gambar Kost
# =======================
class GambarKostResponse(BaseModel):
    id_gambar: int
    url_gambar: str

    class Config:
        from_attributes = True

class GambarBase(BaseModel):
    url_gambar: str


class GambarCreate(GambarBase):
    pass


class GambarResponse(GambarBase):
    id_gambar: int

    class Config:
        orm_mode = True

# =======================
# Schema untuk Fasilitas
# =======================
class FasilitasResponse(BaseModel):
    id_fasilitas: int
    nama_fasilitas: str

    class Config:
        from_attributes = True
        
class FasilitasCreate(BaseModel):
    nama_fasilitas: str

# =======================
# Schema untuk Kost
# =======================
class KostBase(BaseModel):
    nama_kost: str
    alamat: str
    deskripsi: Optional[str] = None  # Deskripsi boleh NULL
    harga_sewa: condecimal(max_digits=10, decimal_places=2)
    luas: conint(gt=0)  # Luas tidak boleh 0 atau negatif
    status_properti: StatusPropertiEnum
    jenis_sertifikat: Optional[JenisSertifikatEnum] = None
    luas_tanah: Optional[conint(gt=0)] = None
    longitude: float  # Tidak boleh NULL
    latitude: float  # Tidak boleh NULL


class KostCreate(KostBase):
    fasilitas: List[int] = []  # List ID fasilitas
    gambar: List[str] = []

class KostUpdate(BaseModel):
    nama_kost: Optional[str]
    alamat: Optional[str]
    deskripsi: Optional[str]
    harga_sewa: Optional[float]
    luas: Optional[int]
    luas_tanah: Optional[int]
    status_properti: Optional[str]
    jenis_sertifikat: Optional[str]
    longitude: Optional[float]
    latitude: Optional[float]

class KostResponse(KostBase):
    id_kost: int
    gambar: List[GambarKostResponse] = []  # Kost bisa punya banyak gambar
    fasilitas: List[FasilitasResponse] = []  # Menampung objek fasilitas, bukan hanya ID

    class Config:
        from_attributes = True


