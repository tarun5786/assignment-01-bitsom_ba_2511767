# Anamoly Analysis
Anamolies are the real-world problems faced with chaotic Databases where every record is stored in one single table raising problem like
1. Inefficient storage of data (when certain record is stored multiple times) ~Redundancy Anamoly
2. Introducing new product to the data table is done unless other attribute columns are filled ~Insertion Anamoly
3. if changes are to be made in certain cell in the table. It requires the change manually in multiple rows of the table ~Updation Anamoly
4. accidental deletion can erase important data ~Deletion Anamoly
All of this somes up to data inconsistency or In accuracy in data
And this cause trouble in drawing insights from the data

## Reference of Anamolies in orders_flat.csv db
look in the orders_flat.csv from dataset folder

### Insertion Anamoly:
If I had to store new sales representative details - (sales_rep_name, sales_rep_email)  
it is not possible add new sales presentatve "SR04" data to the table unless there is new order placed by the customer

### Updation Anamoly:
if customer named "Priya Sharma" want to change their city from Delhi to Hyderabad. <br>
the existing city name need to be change in multiple rows.
to understand to refer column "customer_city", row - (2, 5, 21)

### Deletion Anamoly:
refer row - 16  
if unintentionally row - 16 is deleted the laptops sold at value 2,20,000, record is lost and alarms loss in revenue made by the retailer

## Normalization Justification
Though one flat table is simple. it raise problems of  
- flat table increase storage expenses because of data being repeated multiple times.
- cannot have new product or new sales representative data unless a order is placed.
- if changes are to be made in customer details it need to reflect in multiple rows. doing this manually is tedious.
- if some row is deleted, data regarding sales, revenue are effected.  

So to avoid all these problems. Normalizing is the go to option.  
Normalizations is technique to organise data into different tables also called entities to provide meaning. <br>
out orders_flat.cvs is normalized into customers, employees, product_type, products, purchase tables. <br>
you might be thinking what do I gain from normalizing.  
what is it actually does is ?  
- This reduces the data storage cost.
- Removes data redudancy/Insertion/updation/deletion
- ease of drawing insights from the data
- ease of viewing only necessay data <br>

How it does? <br>
In Normalization every table is connect to other table by a common attribute/column in the table. <br>
this allows <br>
- view only necessary data
- Insert data on the fly. For example I can easily add new sales representative details into employees since every table is defined by the function they do like storing employees details, customer details etc.
- updation ~if i change city name for customer named "Priya Sharma" I can just update it in customers table it reflects every where in the database
- deletion ~since every table is connected deletion restricted unless you specify explicitly.



