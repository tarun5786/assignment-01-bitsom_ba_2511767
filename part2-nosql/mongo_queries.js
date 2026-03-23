use("ecommerce");

// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.sample_documents.insertMany(
    [{
    "Product_id": "E001",
    "Brand": "Apple",
    "Name": "MacBook Neo",
    "Screen Size": "13 Inches",
    "Colour": "Silver",
    "Specifications": {
        "CPU Model": "Apple A18 Pro",
        "Battery Life": "16 hrs",
        "RAM Size": "8 GB",
        "OS": "Mac OS",
        "Hard Disk": "SSD",
    },
    "Category": "Electronics",
    "Price": 77900,
    },
    {
        "Product_id": "G001",
        "Brand": "Tata Sampann",
        "Name": "Chilli Powder",
        "Flavour": "Chilly",
        "Quantity": "500 Grams",
        "Origin": "South India",
        "Use By": "2027-02-21",
        "Category": "Groceries",
        "Price": 500,

    },
    {
        "Product_id": "C001",
        "Brand": "Rare Rabbit",
        "Name": "Men's Rory Light Blue Cotton Plain Baggy Fit Jeans",
        "Material type": "Cotton",
        "Length": "Standard Length",
        "Style": "Classic",
        "Closure type": "Button",
        "Care instructions": "Hand Wash Only",
        "Fit type": "Oversized",
        "Category": "Clothing",
        "Price": 2829,
    }]);


// OP2: find() — retrieve all Electronics products with price > 20000
db.sample_documents.find({ Category: "Electronics" }, { Price: { $gt: 20000 });

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.sample_documents.find({ Category: "Groceries", "Use By": {$lt: "2025-01-01"}});

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.sample_documents.updateOne( {"Product_id": "E001"}, { $set: {"Discount_percentage": 10}});

// OP5: createIndex() — create an index on category field and explain why
db.sample_documents.createIndex({ Category: 1})

/*
when a search query ran in MongoDB search through every document in the collection to find matching results.
working with large data this increases the response time.
if you have an appropriate index, then MongoDB can jump directly to a subset of matching documents instead of searching all of them.
So, by indexing Category can pull out results faster since, Ecommerce user find products by category.
*/
    
