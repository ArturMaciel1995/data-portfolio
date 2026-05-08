import pandas as pd

# Extract
order_items = pd.read_csv('../../data/raw/olist_orders_items_dataset.csv')
orders = pd.read_csv('../../data/processed/orders.csv')

# Transform
order_items_df = order_items[
    ['order_id',
     'order_item_id',
     'product_id',
     'seller_id',
     'shipping_limit_date',
     'price',
     'freight_value']
].copy()

orders_df = orders[
    ['order_id',
     'order_sk']
].copy()

# Merge
order_items_merged = pd.merge(
    order_items_df,
    orders_df,
    on='order_id',
    how='left',
    validate='many_to_one'
)

# Mantém apenas colunas necessárias
order_items_final = order_items_merged.drop(
    columns=['order_id']
)

order_items_final = order_items_final.reset_index(drop=True)

# Surrogate key
order_items_final['order_item_sk'] = order_items_final.index + 1

order_items_final = order_items_final[
    ['order_item_sk',
     'order_sk',
     'order_item_id',
     'product_id',
     'seller_id',
     'shipping_limit_date',
     'price',
     'freight_value'
     ]
]

# Garante integridade do merge
if order_items_final['order_sk'].isna().any():
    raise ValueError("Existem itens sem order_sk")

# Load (arquivo processed)
order_items_final.to_csv('../../data/processed/order_items.csv', index=False)