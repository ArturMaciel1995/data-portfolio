import pandas as pd
from sqlalchemy import create_engine

# Extract
order_items = pd.read_csv('../../data/processed/order_items.csv')

# Data quality check
if order_items.empty:
    raise ValueError("Arquivo order_items.csv está vazio")

# Load
engine = create_engine("postgresql://postgres:postgres@localhost:5432/ecommerce_dw")

order_items.to_sql(
    'order_items',
    engine,
    if_exists='append',
    index=False
)