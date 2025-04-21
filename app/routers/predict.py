from fastapi import APIRouter, HTTPException, Depends, Request
from app import models, schemas
from app.database import get_db
from sqlalchemy.orm import Session
from math import radians, sin, cos, sqrt, atan2
import joblib
from collections import defaultdict
import pandas as pd
import numpy as np

router = APIRouter()


# load data and model
df_public_places = pd.read_csv("dataset/public_places.csv", delimiter=';')
model = joblib.load("model/xgb_model.pkl")
feature_columns = joblib.load("model/xgb_model_columns.pkl")

# group public places
places_by_type = defaultdict(list)
for _, row in df_public_places.iterrows():
    places_by_type[row["Jenis"]].append((row["latitude"], row["longitude"]))

# facility groups
facility_groups = {
    "fasilitas_premium": {
        'ac', 'air panas', 'cermin', 'kamar mandi dalam', 'kloset duduk',
        'kulkas', 'kursi', 'meja', 'parkir mobil', 'shower', 'tv'
    },
    "fasilitas_non_premium": {
        'bak mandi', 'ember mandi', 'jemuran', 'kamar mandi luar',
        'kloset jongkok', 'locker', 'microwave', 'parkir motor',
        'rice cooker', 'taman', 'termasuk listrik'
    },
    "fasilitas_netral": {
        'bantal', 'bathtub', 'cctv', 'cleaning service', 'dapur', 'dispenser',
        'guling', 'kartu akses', 'kasur', 'kipas angin', 'laundry', 'lemari baju',
        'meja makan', 'mushola', 'parkir sepeda', 'penjaga kos', 'ruang santai',
        'sofa', 'wastafel', 'wifi'
    },
    "premium_facilities": {
        'ac', 'air panas', 'kloset duduk', 'shower', 'kulkas', 'tv',
        'bathtub', 'sofa', 'kamar mandi dalam', 'kartu akses'
    },
    "basic_facilities": {
        'kasur', 'bantal', 'guling', 'meja', 'kursi', 'lemari baju',
        'cermin', 'dispenser', 'wastafel', 'meja makan'
    },
    "bathroom_modern": {
        'shower', 'kloset duduk', 'bathtub', 'wastafel'
    },
    "bathroom_traditional": {
        'bak mandi', 'ember mandi', 'kloset jongkok'
    },
    "security_facilities": {
        'cctv', 'kartu akses', 'penjaga kos'
    },
    "shared_facilities": {
        'ruang santai', 'dapur', 'mushola', 'taman', 'jemuran', 'laundry'
    },
    "parking_facilities": {
        'parkir mobil', 'parkir motor', 'parkir sepeda'
    },
    "electronic_facilities": {
        'ac', 'tv', 'kulkas', 'dispenser', 'rice cooker', 'microwave', 'kipas angin'
    },
    "utility_facilities": {
        'wifi', 'termasuk listrik', 'cleaning service'
    }
}

def haversine_distance(lat1, lon1, lat2, lon2):
    # handle series datatype
    if isinstance(lat1, pd.Series): lat1 = lat1.iloc[0]
    if isinstance(lon1, pd.Series): lon1 = lon1.iloc[0]
    if isinstance(lat2, pd.Series): lat2 = lat2.iloc[0]
    if isinstance(lon2, pd.Series): lon2 = lon2.iloc[0]
    lat1, lon1, lat2, lon2 = float(lat1), float(lon1), float(lat2), float(lon2)

    R = 6371
    dlat = radians(lat2 - lat1)
    dlon = radians(lon2 - lon1)
    a = sin(dlat / 2)**2 + cos(radians(lat1)) * cos(radians(lat2)) * sin(dlon / 2)**2
    c = 2 * atan2(sqrt(a), sqrt(1 - a))
    return R * c

def create_feature(data):
    data['luas'] = data['panjang'] * data['lebar']
    
    # calculate nearest public place distance
    for place_type, coords in places_by_type.items():
        min_dist = min(
            haversine_distance(data["latitude"], data["longitude"], lat, lon)
            for lat, lon in coords
        )
        data[f'jarak_{place_type.lower()}_terdekat'] = min_dist

    # count facilities
    for group_name, fasilitas_set in facility_groups.items():
        data[f'jumlah_{group_name}'] = sum(data.get(f, 0) for f in fasilitas_set)

    # total facilities
    data["total_facilities"] = (
        data["jumlah_fasilitas_premium"] +
        data["jumlah_fasilitas_non_premium"] +
        data["jumlah_fasilitas_netral"]
    )

    # ratios
    total = np.maximum(data["total_facilities"], 1)
    data['premium_ratio'] = data['jumlah_fasilitas_premium'] / total
    data['non_premium_ratio'] = data['jumlah_fasilitas_non_premium'] / total
    data['netral_ratio'] = data['jumlah_fasilitas_netral'] / total

    # check all feature is available
    for col in feature_columns:
        if col not in data.columns:
            data[col] = 0

    # reindex
    return data.reindex(columns=feature_columns)


@router.post("/price")
def predict_price(predictModel: schemas.PredictPrice, db: Session = Depends(get_db)):
    form_data = predictModel
    data_dict = {}

    try:
        # convert numeric input
        for field in ["latitude", "longitude", "panjang", "lebar"]:
            value = getattr(form_data, field)
            if value is not None:
                data_dict[field] = float(value)
            else:
                raise ValueError(f"Missing required field: {field}")

        # handle facilities
        all_facilities = (
            facility_groups["fasilitas_premium"] |
            facility_groups["fasilitas_non_premium"] |
            facility_groups["fasilitas_netral"]
        )
        for facility in all_facilities:
            data_dict[facility] = 1 if form_data.fasilitas and facility in form_data.fasilitas else 0

        # create DataFrame and predict
        df = pd.DataFrame([data_dict])
        df = create_feature(df)
        prediction = model.predict(df)[0]

        return {'prediksi_harga': int(prediction)}

    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))