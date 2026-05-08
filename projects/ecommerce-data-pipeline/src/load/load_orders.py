import pandas as pd
from sqlalchemy import create_engine

# Extract
orders = pd.read_csv('../../data/processed/orders.csv')

# Data quality check
if orders.empty:
    raise ValueError("Arquivo orders.csv está vazio")

# Load
engine = create_engine("postgresql://postgres:postgres@localhost:5432/ecommerce_dw")

orders.to_sql(
    'orders',
    engine,
    if_exists='append',
    index=False
)