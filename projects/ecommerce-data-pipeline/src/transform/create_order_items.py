import pandas as pd

# Extract
order_items = pd.read_csv('../../data/raw/olist_order_items_dataset.csv')
orders = pd.read_csv('../../data/processed/orders.csv')
products = pd.read_csv('../../data/processed/products.csv')
sellers = pd.read_csv('../../data/processed/sellers.csv')

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

products_df = products[
    ['product_id', 'product_sk']
].copy()

sellers_df = sellers[
    ['seller_id', 'seller_sk']
].copy()

# Merge
order_items_merged = pd.merge(
    order_items_df,
    orders_df,
    on='order_id',
    how='left',
    validate='many_to_one'
)

order_items_merged = pd.merge(
    order_items_merged,
    products_df,
    on='product_id',
    how='left',
    validate='many_to_one'
)

order_items_merged = pd.merge(
    order_items_merged,
    sellers_df,
    on='seller_id',
    how='left',
    validate='many_to_one'
)

# Mantém apenas colunas necessárias
order_items_final = order_items_merged.drop(
    columns=['order_id',
             'product_id',
             'seller_id']
)

order_items_final = order_items_final.reset_index(drop=True)

# Surrogate key
order_items_final['order_item_sk'] = order_items_final.index + 1

order_items_final = order_items_final[
    ['order_item_sk',
     'order_sk',
     'order_item_id',
     'product_sk',
     'seller_sk',
     'shipping_limit_date',
     'price',
     'freight_value'
     ]
]

# Garante integridade do merge
if order_items_final['order_sk'].isna().any():
    raise ValueError("Existem itens sem order_sk")

if order_items_final['product_sk'].isna().any():
    raise ValueError("Existem itens sem product_sk")

if order_items_final['seller_sk'].isna().any():
    raise ValueError("Existem itens sem seller_sk")

# Load (arquivo processed)
order_items_final.to_csv('../../data/processed/order_items.csv', index=False)