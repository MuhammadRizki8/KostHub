from pydantic import BaseModel, EmailStr, condecimal, conint, Field
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

class UserLogin(BaseModel):
    email:EmailStr
    password: str

class UserResponse(UserBase):
    id_user: int
    role: str
    has_seen_guide: bool

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
    luas: Optional[int] = Field(default=None, ge=0)  # ge = greater than or equal
    luas_tanah: Optional[int] = Field(default=None, ge=0)
    panjang: float
    lebar: float
    status_properti: StatusPropertiEnum
    jenis_sertifikat: Optional[JenisSertifikatEnum] = None
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
    panjang: Optional[float]
    lebar: Optional[float]
    luas_tanah: Optional[int]
    status_properti: Optional[str]
    jenis_sertifikat: Optional[str]
    longitude: Optional[float]
    latitude: Optional[float]

class KostResponse(KostBase):
    id_kost: int
    gambar: List[GambarKostResponse] = Field(default_factory=list, alias="gambar_kost")
    fasilitas: List[FasilitasResponse] = []

    class Config:
        from_attributes = True
        allow_population_by_field_name = True

class PredictPrice(BaseModel):
    latitude: Optional[float]
    longitude: Optional[float]
    panjang: Optional[float]
    lebar: Optional[float]
    fasilitas: Optional[list[str]]

class FavoriteRequest(BaseModel):
    id_user: int
    id_kost: int

class UpdateGuideStatus(BaseModel):
    has_seen_guide: bool