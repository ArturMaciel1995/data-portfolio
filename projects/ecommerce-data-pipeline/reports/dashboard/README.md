# E-Commerce Sales Dashboard

Interactive business intelligence dashboard built using Power BI and PostgreSQL, focused on e-commerce sales analysis, KPI monitoring, and executive reporting.

---

## Project Overview

This project was developed to create an executive-level sales dashboard for an e-commerce environment using Power BI.

The dashboard focuses on:

* Revenue monitoring
* KPI analysis
* Sales trends over time
* Regional sales performance
* Product category analysis
* Interactive business filtering

---

## Tech Stack

| Technology | Purpose                              |
| ---------- | ------------------------------------ |
| PostgreSQL | Analytical database                  |
| SQL        | Data querying and preparation        |
| Power BI   | Dashboard development                |
| DAX        | KPI and business metrics creation    |
| GitHub     | Project documentation and versioning |

---

## Data Model

Dimensional model using a Snowflake Schema approach.

### Main Tables

| Table       | Type       |
| ----------- | ---------- |
| order_items | Fact Table |
| orders      | Dimension  |
| customers   | Dimension  |
| cities      | Dimension  |
| products    | Dimension  |
| sellers     | Dimension  |

---

## Database Schema

![Database Schema](reports/diagrams/schema.png)

---

## Executive Dashboard

The dashboard was designed to provide a high-level business overview focused on:

* Revenue monitoring
* Sales trends over time
* Product category performance
* Regional sales analysis
* Freight cost analysis

### KPIs

* Total Revenue
* Total Orders
* Average Ticket
* Total Freight

---

## Dashboard Preview

![Executive Overview](reports/dashboard/screenshots/executive_overview.png)

---

## DAX Measures

### Total Revenue

```DAX
Total Revenue = SUM(order_items[price])
```

### Total Orders

```DAX
Total Orders = DISTINCTCOUNT(orders[order_id])
```

### Average Ticket

```DAX
Average Ticket = DIVIDE([Total Revenue], [Total Orders])
```

### Total Freight

```DAX
Total Freight = SUM(order_items[freight_value])
```

---

## Project Structure

```text
E-Commerce-Sales-Dashboard/
│
├── reports/
│   ├── dashboard/
│   │   ├── ecommerce_sales_dashboard.pbix
│   │   └── screenshots/
│   │       └── executive_overview.png
│   │
│   └── diagrams/
│       └── schema.png
│
└── README.md
```

---

## Business Insights

Some insights identified during the analysis:

* Revenue growth trend between 2017 and 2018
* Product categories with highest sales volume
* Regional concentration of sales
* Freight costs impact on total operations

---

## Future Improvements

* Additional analytical dashboard pages
* Advanced DAX measures
* Power BI Service publishing
* Mobile dashboard optimization
* Advanced business insights and drill-through analysis

---

## Key Features

* Dimensional modeling using Snowflake Schema concepts
* PostgreSQL analytical database
* Power BI executive dashboard
* DAX KPI development
* Interactive filters and temporal analysis
* Sales and regional performance analysis
* Clean and responsive dashboard layout

---

## Dashboard Highlights

### Executive Overview

The dashboard provides a business-oriented view of the e-commerce operation through:

* Revenue trend analysis
* Geographic sales distribution
* Product category performance
* Freight monitoring
* Interactive filtering by year and state

---

## Skills Demonstrated

* SQL querying and analytical modeling
* Data warehouse concepts
* Power BI dashboard development
* DAX calculations and KPIs
* Data visualization best practices
* Business intelligence storytelling
* GitHub project organization
