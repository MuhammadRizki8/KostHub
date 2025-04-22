from fastapi import APIRouter, HTTPException, Depends, Request
from app import models, schemas
from app.database import get_db
from sqlalchemy.orm import Session
from math import radians, sin, cos, sqrt, atan2
import joblib
from collections import defaultdict
import pandas as pd
import numpy as np
from scipy.spatial.distance import euclidean

router = APIRouter()


# load data and model
df_public_places = pd.read_csv("dataset/public_places.csv", delimiter=';')
# load model prediksi
model = joblib.load("model/xgb_model.pkl")
feature_columns = joblib.load("model/xgb_model_columns.pkl")
# load scaler and feature for recommender
scaler_facility = joblib.load("model/recommender/scaler/scaler_facility_feature.pkl")
scaler_location = joblib.load("model/recommender/scaler/scaler_location_feature.pkl")
scaler_price = joblib.load("model/recommender/scaler/scaler_price_feature.pkl")
loaded_facility = np.load("model/recommender/feature/facility_feature.npy")
loaded_location = np.load("model/recommender/feature/location_feature.npy")
loaded_price = np.load("model/recommender/feature/price_feature.npy")

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

# static data
facility_features = ['panjang', 'lebar', 'ac', 'air panas', 'bak mandi', 'bantal', 'bathtub', 'cctv', 'cermin', 'cleaning service', 'dapur', 'dispenser', 'ember mandi', 'guling', 'jemuran', 'kamar mandi dalam', 'kamar mandi luar', 'kartu akses', 'kasur', 'kipas angin', 'kloset duduk', 'kloset jongkok', 'kulkas', 'kursi', 'laundry', 'lemari baju', 'locker', 'meja', 'meja makan', 'microwave', 'mushola', 'parkir mobil', 'parkir motor', 'parkir sepeda', 'penjaga kos', 'rice cooker', 'ruang santai', 'shower', 'sofa', 'taman', 'termasuk listrik', 'tv', 'wastafel', 'wifi', 'luas', 'total_facilities', 'jumlah_fasilitas_premium', 'jumlah_fasilitas_non_premium', 'jumlah_fasilitas_netral', 'jumlah_premium_facilities', 'jumlah_basic_facilities', 'jumlah_bathroom_modern', 'jumlah_bathroom_traditional', 'jumlah_security_facilities', 'jumlah_shared_facilities', 'jumlah_parking_facilities', 'jumlah_electronic_facilities', 'jumlah_utility_facilities', 'premium_ratio', 'non_premium_ratio', 'netral_ratio']
location_features = ['latitude', 'longitude', 'jarak_masjid_terdekat', 'jarak_rumah_sakit_terdekat', 'jarak_toserba_terdekat', 'jarak_tempat_makan_terdekat', 'jarak_terminal_terdekat', 'jarak_stasiun_terdekat', 'jarak_kampus_terdekat']
other_features = ['harga']

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

def get_recommendation(user_data):
    # transform user preferences
    user_facility = scaler_facility.transform([[user_data[f].item() for f in facility_features]])
    user_location = scaler_location.transform([[user_data[f].item() for f in location_features]])
    user_price = scaler_price.transform([[user_data[f].item() for f in other_features]])
    print("cek")
    # get distance for user pref to each data
    weighted_distances = []
    for i in range(1473): # static length data based on csv
        d_facility = euclidean(loaded_facility[i], user_facility[0])
        d_location = euclidean(loaded_location[i], user_location[0])
        d_price = euclidean(loaded_price[i], user_price[0])

        total_distance = 0.5 * d_facility + 7.5 * d_location + 2 * d_price
        weighted_distances.append((i+1, total_distance))

    # get top 10 nearest data
    sorted_distances = sorted(weighted_distances, key=lambda x: x[1])

    # get id of kost
    id = [row[0] for row in sorted_distances[:10]]

    return id

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
        df['harga'] = model.predict(df)[0]
        # get recommendation after get price
        id = get_recommendation(df)

        return {
            'prediksi_harga': int(df['harga']),
            'id':id
        }

    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))