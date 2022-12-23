# DB-Application

The assignment requires the following:
You have been tasked with building a database system for a large franchised real
estate company. This means that the company has many offices located all over
the country. Each office is responsible for selling houses in a particular area.
However an estate agent can be associated with one or more offices.



### create.sql 

I first created Create.sql because we need to have the basic framework before inserting, querying and testing the data. All the main tables are set up (and empty) in create.sql. It sets up tables for houses, offices, estate agents, listings, sales and commissions. 

### insert_data.sql 

The insert section allows for houses that are either sold (sales) or listed to be updated with their relevant properties. We can also calculate the commissions the related estate agents earn based on the sliding scale prices. 

### query_data.sql
This file runs the report:
 - Find the top 5 offices with the most sales for that month.
 - Find the top 5 estate agents who have sold the most for the month (include their contact details and their sales details so that it is easy contact them and congratulate them).
 - Calculate the commission that each estate agent must receive and store the results in a separate table. 
 - For all houses that were sold that month, calculate the average number of days on the market.
 - For all houses that were sold that month, calculate the average selling price



### Testing 
For testing, I have tried both small examples in the code and in a separate test file (test_insert.py) to insert data



## Execution (SQLite):

First, downlaod the .sql files.

In terminal, run:

```sqlite3
sqlite3 real_estate.db
sqlite> .read create.sql
sqlite> .read insert_data.sql
sqlite> .read query_data.sql
```
