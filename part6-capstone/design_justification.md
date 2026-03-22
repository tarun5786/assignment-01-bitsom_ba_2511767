## Storage Systems
__Data Lakes__: I chose Data Lake for ML training because it stores large volumes of raw,
unprocessed data from multiple sources such as diagnosis records and
treatment history which ML models need in their original form to learn patterns accurately.
A Data Warehouse would aggregate this data, losing the detail needed for training.

__Vector DB__: I chose vector db for plain english query because of its capability to store clusters of embeddings
which main component for semantic search technique  to retrive data based on meaning.
This is critical in healthcare where the same condition can be described in multiple medical terms.
where a traditional database follow keyword search technique that search exact match of word.  
for example a doctor asks:
"Has this patient had a cardiac event before?"
A keyword search looks for the exact word "cardiac event" but the record might say "heart attack" or "myocardial infarction."
A Vector DB understands these all mean the same thing.

__Operational DB and Data warehouse__: I chose SQL database for day to day transactions becuase of its strict ACID implementation to collect data.
- Atomicity - Either the entire transaction completes or nothing happens
- Consistency - The database always moves from one valid state to another valid state no transaction can leave data in a broken/invalid state.
- Isolation - Two transactions happening at the same time cannot interfere with each other.
- Durability - Even if database crashes the data is secured and safe.

and Data is first stored in the Data Lake in raw form, then extracted, transformed and loaded into the Data Warehouse for analytics purposes.
This cannot be achieved with any other NoSql databases because of their BASE philosophy.
The NoSQL's eventual consistency model is unacceptable in healthcare where patient records must always be immediately accurate and reliable.
Eventually consistent" means data might be temporarily incorrect, is acceptable for social media, but dangerous in hospitals where a wrong patient record could affect treatment.

__Timeseries DB and Kafka__: I chose to use Time series Data base along side kafka to store real time vitals because tranditional database breaks when data velocity is high due to its slow write speed.
Time series handles real time data effecient with its faster write and kafka acts as stream buffer to handle real time data from multiple instances at the same time.
Without Kafka, if TimescaleDB crashes temporarily, all incoming ICU data would be permanently lost

## OLTP vs OLAP Boundary
