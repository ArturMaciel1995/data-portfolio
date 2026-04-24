import pandas as pd

# Extract
customers = pd.read_csv('../../data/raw/olist_customers_dataset.csv')

# Transform
customers_df = customers[
    ['customer_id', 'customer_unique_id', 'customer_city', 'customer_state']
].copy()

# Padronização para garantir match no merge
customers_df['customer_city'] = customers_df['customer_city'].str.upper()
customers_df['customer_state'] = customers_df['customer_state'].str.upper()

cities_df = pd.read_csv('../../data/processed/cities.csv')

# Join para trazer city_sk
customers_merged = pd.merge(
    customers_df,
    cities_df,
    left_on=['customer_city', 'customer_state'],
    right_on=['city_name', 'state'],
    how='left',
    validate='many_to_one'
)

# Mantém apenas colunas necessárias
customers_final = customers_merged.drop(
    columns=['customer_city', 'customer_state', 'city_name', 'state']
)

customers_final = customers_final.reset_index(drop=True)

# Surrogate key
customers_final['customer_sk'] = customers_final.index + 1

customers_final = customers_final[
    ['customer_sk', 'customer_id', 'customer_unique_id', 'city_sk']
]

# Garante integridade do merge
if customers_final['city_sk'].isna().any():
    raise ValueError("Existem customers sem city_sk")

# Load (arquivo processed)
customers_final.to_csv('../../data/processed/customers.csv', index=False)