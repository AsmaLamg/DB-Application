-- This creates and inserts whenever there is a new house listing with its correspdonign details as defined in the listings table 
-- the VALUES here are fictious data for testing 
INSERT INTO listings (house_id, seller_name, seller_email, seller_phone, bedrooms, bathrooms, house_price, zip, listing_date, agent_id, office_id)
VALUES (1, 'Alain Aspect', 'alain@outlook.com', '415-976-0543', 4, 3, 5000000, '20001', '2021-03-03', 1, 1);

-- This creates and inserts an added office 
-- the VALUEs here are fictious data for testing 
INSERT INTO offices (location, name)
VALUES ('Washington', 'One Street');

-- This creates and inserts an added and new estate agent  
-- the VALUEs here are fictious data for testing 
INSERT INTO estate_agents (name, email,  phone)
VALUES ('Richard Atkins', '956-345-1095', 'richardatkins@gmail.com');

-- Calculate the commission for a sale and insert it into the sales table
-- it uses the sliding scale as defined in the if statements  
INSERT INTO sales (house_id, buyer_name, buyer_phone, buyer_email, sale_price, date_sold, agent_id, commission)
SELECT listings.house_id, listings.seller_name, listings.seller_phone, listings.seller_email, listings.listing_price, listings.listing_date, estate_agents.agent_id
--Test data as an example
--SELECT listings.house_id, 'Louisa Red', '125-098-6688', 'lred@gmail.com', 356000, '2021-09-09', 1)
        IF(sale_price < 100000, sale_price * 0.1,
        IF(sale_price BETWEEN 100000 AND 200000, sale_price * 0.075,
        IF(sale_price BETWEEN 200000 AND 500000, sale_price * 0.06,
        IF(sale_price BETWEEN 500000 AND 1000000, sale_price * 0.05, 
        sale_price * 0.04))))
FROM listings 
JOIN estate_agents ON listings.estate_agent_id = estate_agents.estate_agent_id
WHERE listings.house_id = 1;

INSERT INTO commissions (sale_id, agent_id, month, year, commission)
SELECT sales.sale_id, sales.agent_id, EXTRACT(month from sales.date_sold), EXTRACT(YEAR FROM sales.date_sold), sales.commission
FROM sales 
WHERE sales.sale_id = (SELECT MAX(sale_id) FROM sales);

--I removed the update in listings because it seems redundant as the houses table is the parent table with all the houses, and the listings are explicitly available houses comparable to a queue

-- UPDATE listings 
--SET sold = 1 
-- WHERE house_id = (SELECT house_id 
--FROM sales 
--WHERE sale_id = (SELECT MAX(sale_id_ FROM sales

--The original listing must be marked as sold in both the houses table and the listings table. 
UPDATE houses
SET sold = 1
WHERE house_id = 1;






































































