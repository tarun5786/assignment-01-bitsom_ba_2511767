## Design Justification

---

## Storage Systems

### Predict Patient Readmission Risk: Data Lake

I chose a Data Lake to store historical patient data for ML model training because it stores large volumes of raw, unprocessed data from multiple sources such as diagnosis records, lab results, and treatment history which ML models need in their original form to learn patterns accurately. Unlike a Data Warehouse, which aggregates and structures data for analytics, a Data Lake preserves the raw detail that is essential for training accurate predictive models. ML engineers can pull exactly what they need from the Data Lake without being restricted by a predefined schema.

---

### Doctor Queries in Plain English: Vector Database

I chose a Vector Database to enable doctors to query patient history using plain English because of its capability to store clusters of embeddings, which are the core component of semantic search. Unlike traditional databases that follow a keyword search technique matching only the exact word searched, a Vector Database retrieves data based on meaning. This is critical in healthcare where the same medical condition can be described in multiple terms. For example, if a doctor asks "Has this patient had a cardiac event before?", a keyword search looks for the exact phrase "cardiac event" but the record might say "heart attack" or "myocardial infarction." A Vector Database understands that all of these mean the same thing and retrieves the correct records.

---

### Monthly Reports for Hospital Management: Operational DB + ETL + Data Warehouse

I chose a SQL-based Operational Database for day-to-day transactions because of its strict ACID implementation, which guarantees data integrity at all times:

- **Atomicity** — Either the entire transaction completes or nothing happens. For example, a patient payment and billing status must update together — one cannot succeed without the other.
- **Consistency** — The database always moves from one valid state to another. No transaction can leave data in a broken or invalid state. For example, a patient cannot be discharged without a billing record existing.
- **Isolation** — Two transactions happening at the same time cannot interfere with each other. If two doctors update the same patient record simultaneously, isolation ensures they do not overwrite each other's changes.
- **Durability** — Even if the database crashes, all committed data is secured and safe.

This cannot be achieved with NoSQL databases because of their BASE philosophy (Basically Available, Soft state, Eventually Consistent). NoSQL's eventual consistency model is unacceptable in healthcare where patient records must always be immediately accurate and reliable — a temporarily incorrect record could directly affect patient treatment.

For monthly analytics, data is first stored in the Data Lake in raw form, then extracted, transformed, and loaded into the Data Warehouse for analytics purposes. The Data Warehouse is optimized for large analytical queries such as bed occupancy trends and department-wise cost reports, which would severely slow down the Operational Database if run directly on it.

---

### Real-Time ICU Vitals: Kafka + TimescaleDB

I chose to use TimescaleDB alongside Kafka to store and manage real-time ICU vitals because traditional databases break when data velocity is high due to their slow write speed. With 50 ICU patients each sending heart rate, blood pressure, and oxygen readings every second, a regular SQL database would be overwhelmed.

Kafka acts as a stream buffer to handle real-time data arriving from multiple ICU devices simultaneously. It receives thousands of readings per second, holds them temporarily in order, and delivers them to TimescaleDB at a controlled pace, ensuring no data is lost. Without Kafka, if TimescaleDB crashes temporarily, all incoming ICU data would be permanently lost.

TimescaleDB is purpose-built for time-stamped continuous data, enabling fast time-range queries such as "show patient vitals for the last 2 hours", something a regular SQL database would handle very slowly at this scale.

---

## OLTP vs OLAP Boundary

The boundary between the OLTP system and the OLAP system lies at the **Data Lake**.

On the **OLTP side**, data is generated and collected from operational sources — ICU monitors, patient registrations, billing systems, Electronic Health Records (EHR), and the hospital finance system. This data flows into the Operational Database which handles fast, frequent, small transactions. ICU real-time vitals follow a separate path through Kafka and TimescaleDB, which also sit on the OLTP side as they handle real-time operational data rather than analytical workloads.

The **Data Lake marks the boundary** it acts as a central raw storage hub where all operational data is collected before any analytical processing begins.

On the **OLAP side**, the Data Lake feeds three analytical systems. Raw data is used directly for ML model training to predict patient readmission risk. Patient records are transformed into vector embeddings for semantic search via the Vector Database. Structured data is moved through an ETL pipeline into the Data Warehouse, where hospital management can run monthly reports on bed occupancy and department-wise costs.

---

## Trade-offs

### Significant Trade-off: System Complexity

The primary trade-off in this design is the large number of specialized storage systems involved — Kafka, TimescaleDB, Vector DB, Data Lake, Operational Database, and Data Warehouse. While each system is chosen for a specific purpose, managing all of them together introduces significant challenges:

- **Operational Complexity** — Each system requires its own setup, monitoring, maintenance, and expertise. A failure in one system can cascade and affect others.
- **Increased Cost** — Running multiple systems increases infrastructure costs. While a Data Lake is relatively cheap for raw storage, a Data Warehouse becomes increasingly expensive as data accumulates over time.
- **Scalability Concerns** — As the hospital network grows, scaling six different systems independently adds further complexity and cost.

### Mitigation: Adopting a Data Lakehouse Architecture

To mitigate this trade-off, the Data Lake and Data Warehouse can be replaced with a single **Data Lakehouse** (e.g., Databricks or Apache Iceberg). A Data Lakehouse combines the low-cost raw storage of a Data Lake with the structured querying capabilities of a Data Warehouse in a single platform. This reduces the number of systems to maintain, eliminates the complex ETL pipeline between the two, and lowers overall infrastructure cost, while still supporting both ML model training and monthly analytics reporting.

