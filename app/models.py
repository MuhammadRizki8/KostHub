from sqlalchemy import Column, Integer, String, Text, DECIMAL, ForeignKey, Float
from sqlalchemy.orm import relationship
from .database import Base

class User(Base):
    __tablename__ = "users"
    
    id_user = Column(Integer, primary_key=True, index=True)
    nama = Column(String(255), nullable=False)
    email = Column(String(255), unique=True, nullable=False)
    password = Column(Text, nullable=False)
    role = Column(String(10), nullable=False)  # Pastikan nilainya 'pemilik' atau 'pencari'
    
    # Relasi dengan kost dan favorit
    kosts = relationship("Kost", back_populates="pemilik")
    favorit = relationship("Favorit", back_populates="pencari")


class Kost(Base):
    __tablename__ = "kost"
    
    id_kost = Column(Integer, primary_key=True, index=True)
    id_pemilik = Column(Integer, ForeignKey("users.id_user"), nullable=False)
    nama_kost = Column(String(255), nullable=False)
    alamat = Column(Text, nullable=False)
    deskripsi = Column(Text, nullable=False)
    harga_sewa = Column(DECIMAL(15, 2), nullable=False)
    luas = Column(Integer, nullable=False)  # Luas bangunan (m²)
    luas_tanah = Column(Integer, nullable=False)  # Luas tanah (m²)
    longitude = Column(Float, nullable=False)
    latitude = Column(Float, nullable=False)
    status_properti = Column(String(50), nullable=False)  # Misal: 'Sewa', 'Jual'
    jenis_sertifikat = Column(String(100), nullable=False)  # Misal: 'SHM', 'HGB'
    dokumen_properti = Column(Text, nullable=True)  # URL gambar properti utama
    
    # Relasi
    pemilik = relationship("User", back_populates="kosts")
    gambar = relationship("GambarKost", back_populates="kost")
    favorit = relationship("Favorit", back_populates="kost")
    fasilitas = relationship("Fasilitas", secondary="kost_fasilitas", back_populates="kosts")


class Fasilitas(Base):
    __tablename__ = "fasilitas"
    
    id_fasilitas = Column(Integer, primary_key=True, index=True)
    nama_fasilitas = Column(String(255), nullable=False)
    
    kosts = relationship("Kost", secondary="kost_fasilitas", back_populates="fasilitas")


class KostFasilitas(Base):
    __tablename__ = "kost_fasilitas"
    
    id_kost = Column(Integer, ForeignKey("kost.id_kost"), primary_key=True)
    id_fasilitas = Column(Integer, ForeignKey("fasilitas.id_fasilitas"), primary_key=True)


class GambarKost(Base):
    __tablename__ = "gambar_kost"
    
    id_gambar = Column(Integer, primary_key=True, index=True)
    id_kost = Column(Integer, ForeignKey("kost.id_kost"), nullable=False)
    url_gambar = Column(Text, nullable=False)
    
    kost = relationship("Kost", back_populates="gambar")


class Favorit(Base):
    __tablename__ = "favorit"
    
    id_favorit = Column(Integer, primary_key=True, index=True)
    id_pencari = Column(Integer, ForeignKey("users.id_user"), nullable=False)
    id_kost = Column(Integer, ForeignKey("kost.id_kost"), nullable=False)
    
    pencari = relationship("User", back_populates="favorit")
    kost = relationship("Kost", back_populates="favorit")
