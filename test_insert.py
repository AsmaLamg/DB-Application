
import sqlite3

# Connect database
conn = sqlite3.connect("real_estate.db")

cursor = conn.cursor()

# Open  file
with open("insert_data.sql", "r") as f:
    # Read the contents of the file
    sql = f.read()

cursor.executescript(sql)

conn.commit()

conn.close()



houses = [
    {
        "seller": "Jessie Jones",
        "seller_email": "jessie@example.com",
        "seller_phone": "123-456-7777",
        "bedrooms": 5,
        "bathrooms": 3,
        "house_price": 7500000,
        "zip_code": "10001",
        "date_listed": "2021-10-10",
        "estate_agent_id": 1,
        "office_id": 1
    }
]

offices = [
    {
        "name": "Office",
        "location": "Washington"
    }
]

estate_agents = [
    {
        "name": "Sherlock Holmes",
        "phone": "345-666-8888",
        "email": "sholmes@minerva.edu"
    }
]

sales = [
    {
        "listing_id": 1,
        "buyer_name": "Rory May",
        "buyer_phone": "609-906-4444",
        "buyer_email": "rory@gmail.com",
        "sale_price": 5065777,
        "date_sold": "2020-05-05",
        "estate_agent_id": 1
    }
]
