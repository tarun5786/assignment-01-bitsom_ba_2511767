## ETL Decisions

### Decision 1 — Date Format Standardization
Problem: The raw CSV contained dates in multiple formats 
such as 29/08/2023, 12-12-2023 and 2023-02-05. 
Resolution: All dates were standardized to YYYY-MM-DD format 
before inserting into dim_date

### Decision 2 — Inconsistent Category Casing
Problem: The category column had inconsistent values 
such as Grocery and Groceries for the same category
Resolution: All categories were standardized to Groceries
before inserting into dim_product

### Decision 3 — NULL Value Handling
Problem: Some rows in the CSV contained NULL values 
in key columns like store_city
Resolution: Rows with NULL values were excluded 
to maintain data quality in fact_sales
