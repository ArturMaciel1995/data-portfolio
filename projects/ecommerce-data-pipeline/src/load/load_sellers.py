import pandas as pd
from sqlalchemy import create_engine

# Extract
sellers = pd.read_csv('../../data/processed/sellers.csv')

# Data quality check
if sellers.empty:
    raise ValueError("Arquivo sellers.csv está vazio")

# Load
engine = create_engine("postgresql://postgres:postgres@localhost:5432/ecommerce_dw")

sellers.to_sql(
    'sellers',
    engine,
    if_exists='append',
    index=False
)