import pandas as pd

# Extract
orders = pd.read_csv('../../data/raw/olist_orders_dataset.csv')
customers = pd.read_csv('../../data/processed/customers.csv')

# Transform
orders_df = orders[
    ['order_id',
     'customer_id',
     'order_status',
     'order_purchase_timestamp',
     'order_approved_at',
     'order_delivered_customer_date',
     'order_estimated_delivery_date']
].copy()

customers_df = customers[
    ['customer_id',
     'customer_sk']
].copy()

# Merge
orders_merged = pd.merge(
    orders_df,
    customers_df,
    on='customer_id',
    how='left',
    validate='many_to_one'
)

# Mantém apenas colunas necessárias
orders_final = orders_merged.drop(
    columns=['customer_id']
)

orders_final = orders_final.reset_index(drop=True)

# Surrogate key
orders_final['order_sk'] = orders_final.index + 1

orders_final = orders_final[
    ['order_sk',
     'order_id',
     'customer_sk',
     'order_status',
     'order_purchase_timestamp',
     'order_approved_at',
     'order_delivered_customer_date',
     'order_estimated_delivery_date'
     ]
]

# Garante integridade do merge
if orders_final['customer_sk'].isna().any():
    raise ValueError("Existem pedidos sem customer_sk")

# Load (arquivo processed)
orders_final.to_csv('../../data/processed/orders.csv', index=False)