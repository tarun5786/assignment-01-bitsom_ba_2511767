use("ecommerce");

// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.sample_documents.insertMany(
    [{
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
db.sample_documents.find({}, [{ Category: "Electronics" }, { Price: { $gt: 20000 } }]);