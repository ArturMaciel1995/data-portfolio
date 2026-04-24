import pandas as pd

# Extract
customers = pd.read_csv('../../data/raw/olist_customers_dataset.csv')

# Transform
cities_df = customers[['customer_city', 'customer_state']].copy()

# Padronização para evitar duplicidade
cities_df['customer_city'] = cities_df['customer_city'].str.upper()
cities_df['customer_state'] = cities_df['customer_state'].str.upper()

# Remover duplicados
cities_unique = cities_df.drop_duplicates().reset_index(drop=True)

# Surrogate key
cities_unique['city_sk'] = cities_unique.index + 1

# Renomear para padrão da dimensão
cities_unique = cities_unique.rename(columns={
    'customer_city': 'city_name',
    'customer_state': 'state'
})

cities_unique = cities_unique[['city_sk', 'city_name', 'state']]

# Load (arquivo processed)
cities_unique.to_csv('../../data/processed/cities.csv', index=False)