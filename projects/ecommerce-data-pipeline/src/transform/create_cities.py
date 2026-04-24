import pandas as pd

customers = pd.read_csv("../../data/raw/olist_customers_dataset.csv")

cities_df = customers[['customer_city', 'customer_state']].copy()

cities_df['customer_city'] = cities_df['customer_city'].str.upper()
cities_df['customer_state'] = cities_df['customer_state'].str.upper()

cities_unique = cities_df.drop_duplicates()
cities_unique = cities_unique.reset_index(drop=True)

cities_unique['city_sk'] = cities_unique.index + 1

cities_unique = cities_unique.rename(columns={
    "customer_city": "city_name",
    "customer_state": "state"
})

cities_unique = cities_unique[['city_sk', 'city_name', 'state']]

print(cities_unique.head())
print(cities_unique.shape)

cities_unique.to_csv("../../data/processed/cities.csv", index=False)