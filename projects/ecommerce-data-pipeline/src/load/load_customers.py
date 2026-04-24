import pandas as pd
from sqlalchemy import create_engine

# Extract
customers = pd.read_csv('../../data/processed/customers.csv')

# Data quality check
if customers.empty:
    raise ValueError("Arquivo customers.csv está vazio")

# Load
engine = create_engine("postgresql://postgres:postgres@localhost:5432/ecommerce_dw")

customers.to_sql(
    'customers',
    engine,
    if_exists='append',
    index=False
)