# Ecommerce Data Pipeline

End-to-end data engineering and analytics project built using the Brazilian Olist e-commerce dataset.

This project simulates a real-world analytical data workflow, including ETL pipelines, dimensional modeling, surrogate key generation, data quality validation, and loading data into a PostgreSQL data warehouse.

---

## Technologies

* Python (pandas)
* PostgreSQL
* SQL
* SQLAlchemy
* Git / GitHub
* Power BI

---

## Data Pipeline Overview

* Extract data from raw CSV datasets
* Transform and clean data using pandas
* Standardize categorical and location fields
* Remove duplicates and validate relationships
* Generate surrogate keys
* Build dimensional and fact tables
* Create Star Schema relationships
* Load analytical datasets into PostgreSQL
* Prepare datasets for Power BI analytics

---

## Current Dimensional Model

### Dimensions

#### Cities

* Unique city and state records
* Surrogate key (`city_sk`)

#### Customers

* Customer identifiers
* Relationship with cities via `city_sk`

#### Products

* Product category and physical attributes
* Product dimensions and weight information

#### Sellers

* Seller location information
* Seller city, state, and zip code

#### Orders

* Order status and purchase timestamps
* Relationship with customers

---

### Fact Table

#### Order Items

* Product-level order transactions
* Relationships with orders, products, and sellers
* Metrics:

  * Product price
  * Freight value

---

## Data Quality & Validation

Implemented validation checks to ensure:

* Referential integrity between dimensions and fact tables
* Non-null surrogate keys after merges
* Consistent dimensional relationships
* Standardized categorical values

---

## Project Structure

```text
src/
 ├── transform/
 └── load/

data/
 ├── raw/
 └── processed/
```

---

## Current Status

In active development.

Next steps include:

* Power BI dashboards
* Analytical SQL queries
* KPI development
* Data model visualization
* Additional business metrics and analytics
