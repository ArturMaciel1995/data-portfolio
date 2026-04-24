import pandas as pd
from sqlalchemy import create_engine

# Extract
cities = pd.read_csv('../../data/processed/cities.csv')

# Data quality check
if cities.empty:
    raise ValueError("Arquivo cities.csv está vazio")

# Load
engine = create_engine("postgresql://postgres:postgres@localhost:5432/ecommerce_dw")

cities.to_sql(
    'cities',
    engine,
    if_exists='append',
    index=False
)