import pandas as pd

# Extract
sellers = pd.read_csv('../../data/raw/olist_sellers_dataset.csv')

# Transform
sellers_df = sellers[
    ['seller_id',
     'seller_zip_code_prefix',
     'seller_city',
     'seller_state']
].copy()

# Padronização para evitar duplicidade
sellers_df['seller_city'] = sellers_df['seller_city'].str.upper()
sellers_df['seller_state'] = sellers_df['seller_state'].str.upper()

sellers_df = sellers_df.reset_index(drop=True)

# Surrogate key
sellers_df['seller_sk'] = sellers_df.index + 1

sellers_df = sellers_df[
    ['seller_sk',
     'seller_id',
     'seller_zip_code_prefix',
     'seller_city',
     'seller_state']
]

# Garante integridade da dimensão
if sellers_df['seller_sk'].isna().any():
    raise ValueError("Existem sellers sem seller_sk")

# Load (arquivo processed)
sellers_df.to_csv('../../data/processed/sellers.csv', index=False)