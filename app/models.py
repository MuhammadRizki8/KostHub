from sqlalchemy import Column, Integer, String, Text, Numeric, ForeignKey, Enum, Double, Float, Boolean  
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
import enum

Base = declarative_base()

class StatusPropertiEnum(enum.Enum):
    SEWA = "Sewa"
    JUAL = "Jual"

class JenisSertifikatEnum(enum.Enum):
    SHM = "Sertifikat Hak Milik (SHM)"
    SHGB = "Sertifikat Hak Guna Bangunan (SHGB)"
    SHGU = "Sertifikat Hak Guna Usaha (SHGU)"
    HPL = "Sertifikat Hak Pengelolaan (HPL)"
    SHS = "Sertifikat Hak Sewa (SHS)"
    SHP = "Sertifikat Hak Pakai (SHP)"
    SHM_ADAT = "Sertifikat Hak Masyarakat Adat (SHM Adat)"

class Kost(Base):
    __tablename__ = 'kost'
    
    id_kost = Column(Integer, primary_key=True)
    nama_kost = Column(String(255), nullable=False)
    alamat = Column(Text, nullable=False)
    deskripsi = Column(Text, nullable=True)  
    harga_sewa = Column(Numeric(10, 2), nullable=False)
    luas = Column(Integer, nullable=False)
    panjang = Column(Float, nullable=True) 
    lebar = Column(Float, nullable=True) 
    status_properti = Column(Enum(StatusPropertiEnum, name="status_properti_enum", native_enum=True, values_callable=lambda enum_cls: [e.value for e in enum_cls]))
    jenis_sertifikat = Column(Enum(JenisSertifikatEnum, name="jenis_sertifikat_enum", native_enum=True, values_callable=lambda enum_cls: [e.value for e in enum_cls]))
    luas_tanah = Column(Integer, nullable=False)
    longitude = Column(Double, nullable=False)  # Tidak boleh NULL
    latitude = Column(Double, nullable=False)  # Tidak boleh NULL

    gambar_kost = relationship("GambarKost",back_populates="kost",cascade="all, delete-orphan",lazy="joined")
    kost_fasilitas = relationship("KostFasilitas", back_populates="kost", cascade="all, delete")
    favorited_by_users = relationship("Favorites", back_populates="kost", cascade="all, delete")
    fasilitas = relationship("Fasilitas", secondary="kost_fasilitas", backref="kosts")  # Relasi ke fasilitas
    
class GambarKost(Base):
    __tablename__ = "gambar_kost"
    
    id_gambar = Column(Integer, primary_key=True, index=True)
    url_gambar = Column(String, nullable=False)
    id_kost = Column(Integer, ForeignKey("kost.id_kost", ondelete="CASCADE"))

    kost = relationship("Kost", back_populates="gambar_kost")


class Fasilitas(Base):
    __tablename__ = 'fasilitas'
    
    id_fasilitas = Column(Integer, primary_key=True)
    nama_fasilitas = Column(String(255), nullable=False, unique=True)
    
    kost_fasilitas = relationship("KostFasilitas", back_populates="fasilitas", cascade="all, delete")

class KostFasilitas(Base):
    __tablename__ = 'kost_fasilitas'
    
    id_kost = Column(Integer, ForeignKey('kost.id_kost', ondelete='CASCADE'), primary_key=True)
    id_fasilitas = Column(Integer, ForeignKey('fasilitas.id_fasilitas', ondelete='CASCADE'), primary_key=True)
    
    kost = relationship("Kost", back_populates="kost_fasilitas")
    fasilitas = relationship("Fasilitas", back_populates="kost_fasilitas")

class Favorites(Base):
    __tablename__ = 'favorit'
    
    id_favorit = Column(Integer, primary_key=True)
    id_pencari = Column(Integer, ForeignKey('users.id_user', ondelete='CASCADE'), nullable=False)
    id_kost = Column(Integer, ForeignKey('kost.id_kost', ondelete='CASCADE'), nullable=False)
    
    kost = relationship("Kost", back_populates="favorited_by_users")
    pencari = relationship("User", back_populates="favorited_kosts")

class User(Base):
    __tablename__ = 'users'
    
    id_user = Column(Integer, primary_key=True)
    nama = Column(String(255), nullable=False)
    email = Column(String(255), nullable=False, unique=True)
    password = Column(Text, nullable=False)
    role = Column(String(10), nullable=False)
    has_seen_guide = Column(Boolean, default=False)
    
    favorited_kosts = relationship("Favorites", back_populates="pencari", cascade="all, delete")