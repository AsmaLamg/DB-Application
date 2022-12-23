-- the top 5 offices most sales for that month.
SELECT offices.name, COUNT(sales.sale_id) AS num_sales -- count to find the *most* sales 
FROM sales 
INNER JOIN listings ON sales.house_id = listings.house_id -- only intersested in sold listings 
INNER JOIN offices ON listings.office_id = offices.office_id -- combine sold listings with office ids, only retrieve matching rows 
WHERE strftime('%m', sales.date_sold) = strftime('%m', 'now') -- this month 
GROUP BY offices.office_id
ORDER BY num_sales DESC
LIMIT 5;

-- top 5 estate agents that sold the most houses for this month (phone number included to reach out)
SELECT estate_agents.name, estate_agents.phone COUNT(sales.sale_id) AS num_sales
FROM sales 
INNER JOIN estate_agents ON sales.agent_id = estate_agents.agent_id -- only retrieve corresponding agents for the defined sales condition
WHERE strftime('%m', s.date_sold) = strftime('%m', 'now') -- *this* month 
GROUP BY estate_agents.agent_id -- group by estate agents 
ORDER BY num_sales DESC -- *top* 5 
LIMIT 5; --top *5* 

-- Calculate the commission that each estate agent must receive for the month
SELECT estate_agents.name, SUM(commissions.commission) AS received_commission
FROM commissions 
INNER JOIN sales ON commissions.sale_id = sales.sale_id
INNER JOIN estate_agents ON commissions.agent_id = estate_agents.agent_id
WHERE commissions.month = strftime('%m', 'now') AND commissions.year = strftime('%Y', 'now')
GROUP BY estate_agents.agent_id;

-- with help: https://www.w3resource.com/sqlite/sqlite-strftime.php + https://www.sqlite.org/lang_datefunc.html

-- For all houses that were sold that month, calculate the average number of days on the market.
SELECT AVG(julianday(sales.date_sold) - julianday(listings.listing_date)) AS mean_market_days 
FROM sales 
INNER JOIN listings ON sales.house_id = listings.house_id
WHERE strftime('%m', sales.date_sold) = strftime('%m', 'now');

-- For all houses that were sold that month, calculate the average selling price
SELECT AVG(sales.sale_price) AS mean_price  -- mean is calculated based on strftime extraction
FROM sales 
WHERE strftime('%m', sales.date_sold) = strftime('%m', 'now'); -- from sales table extract date_sold from now 




