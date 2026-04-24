# Ecommerce Data Pipeline

End-to-end data pipeline built using the Brazilian Olist dataset.

The project simulates a real-world data engineering workflow, including data extraction, transformation, modeling, and loading into a relational database.

---

## Technologies

* Python (pandas)
* PostgreSQL
* SQL
* Git

---

## Data Pipeline Overview

* Extract data from raw CSV files
* Transform and clean data using pandas
* Standardize city and state values
* Remove duplicates
* Create surrogate keys
* Build dimensional tables
* Load data into PostgreSQL

---

## Data Modeling

### Dimension: Cities

* Unique list of cities and states
* Surrogate key (`city_sk`)

### Dimension: Customers

* Customer identifiers
* Relationship with cities via `city_sk`
* Data validation to ensure referential integrity

---

## Project Structure

```
src/
  transform/
  load/

data/
  raw/
  processed/
```

---

## Status

In progress — currently building additional tables (orders, order_items) to complete the pipeline.
