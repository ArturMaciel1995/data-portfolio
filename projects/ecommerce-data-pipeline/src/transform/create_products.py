import pandas as pd

# Extract
products = pd.read_csv('../../data/raw/olist_products_dataset.csv')

# Transform
products_df = products[
    ['product_id',
     'product_category_name',
     'product_weight_g',
     'product_length_cm',
     'product_height_cm',
     'product_width_cm']
].copy()

# Trata categorias ausentes
products_df['product_category_name'] = (
    products_df['product_category_name']
    .fillna('UNKNOWN')
)

products_df = products_df.reset_index(drop=True)

# Surrogate key
products_df['product_sk'] = products_df.index + 1

products_df = products_df[
    ['product_sk',
     'product_id',
     'product_category_name',
     'product_weight_g',
     'product_length_cm',
     'product_height_cm',
     'product_width_cm']
]

# Garante integridade da dimensão
if products_df['product_sk'].isna().any():
    raise ValueError("Existem produtos sem product_sk")

# Load (arquivo processed)
products_df.to_csv('../../data/processed/products.csv', index=False)