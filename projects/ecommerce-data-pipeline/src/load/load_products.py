import pandas as pd
from sqlalchemy import create_engine

# Extract
products = pd.read_csv('../../data/processed/products.csv')

# Data quality check
if products.empty:
    raise ValueError("Arquivo products.csv está vazio")

# Load
engine = create_engine("postgresql://postgres:postgres@localhost:5432/ecommerce_dw")

products.to_sql(
    'products',
    engine,
    if_exists='append',
    index=False
)