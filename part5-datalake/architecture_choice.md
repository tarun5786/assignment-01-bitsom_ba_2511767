## Architecture Recommendation
I would recommend Data lakehouse storage system.
1. The startup is getting all three structured(payment), unstructured(Restaurant menu images) and semi-structured(review) data into the system.
   The traditional data warehouse can only handle structured data. while Data lake handles everything if not governed can turn to swamp.
2. As the startup scales, a Data Lakehouse allows compute and storage to grow independently without rebuilding the architecture.
3. Setting up Dataware house is costly and needs an ETL team to process transformations which sometimes can have mistakes.
   The Data lakehouse provides the functionality of data warehouse and data lake at cheaper price while reducing complex ETL process and allowing direct query from the database.   
4. The Data lakehouse can be used simultaneously for different purposes like for creating analytical report for business, Data scientists
   determine pattern for optimization and AI model training.
