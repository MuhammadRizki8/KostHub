from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base

# Ganti password dan parameter koneksi sesuai dengan konfigurasi lokal Anda
DATABASE_URL = "postgresql://postgres:123@localhost/kost_db"

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()

# Dependency untuk mendapatkan session database
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
