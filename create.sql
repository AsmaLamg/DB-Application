--- create the table for houses 
-- data for houses is inputted in this table

CREATE TABLE houses (
    house_id INTEGER PRIMARY KEY,
    seller_name TEXT NOT NULL,
    seller_email TEXT NOT NULL,
    seller_phone TEXT NOT NULL,
    bedrooms INTEGER NOT NULL,
    bathrooms INTEGER NOT NULL,
    listing_price REAL NOT NULL,
    zip TEXT NOT NULL,
    listing_date DATE NOT NULL,
    agent_id INTEGER NOT NULL,
    office_id INTEGER NOT NULL,
    sold INTEGER NOT NULL DEFAULT 0, -- original listing marked as sold 
    FOREIGN KEY(agent_id) REFERENCES estate_agents(id),
    FOREIGN KEY(office_id) REFERENCES offices(id)
);


-- table for offices
-- data for offices is inputted in this table

CREATE TABLE offices (
    office_id INTEGER PRIMARY KEY,
    location TEXT NOT NULL,
    name TEXT NOT NULL
);



-- table for estate agents
-- data for estate agents is inputted in this table

CREATE TABLE estate_agents (
    agent_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    phone TEXT NOT NULL,
    email TEXT NOT NULL
);


-- table for listings
-- -- data for listings is inputted in this table

CREATE TABLE listings (
    listing_id INTEGER PRIMARY KEY,
    house_id INTEGER NOT NULL,
    seller_name TEXT NOT NULL,
    seller_email TEXT NOT NULL,
    seller_phone TEXT NOT NULL,
    bedrooms INTEGER NOT NULL,
    bathrooms INTEGER NOT NULL,
    listing_price REAL NOT NULL,
    zip TEXT NOT NULL,
    listing_date DATE NOT NULL,
    agent_id INTEGER NOT NULL,
    office_id INTEGER NOT NULL,
    sold INTEGER NOT NULL DEFAULT 0,
    FOREIGN KEY(house_id) REFERENCES houses(house_id),
    FOREIGN KEY(agent_id) REFERENCES estate_agents(agent_id),
    FOREIGN KEY(office_id) REFERENCES offices(office_id)
);


-- table for sales
CREATE TABLE sales (
    sale_id INTEGER PRIMARY KEY,
    house_id INTEGER NOT NULL,
    buyer_name TEXT NOT NULL,
    buyer_phone TEXT NOT NULL,
    buyer_email TEXT NOT NULL,
    sale_price REAL NOT NULL,
    date_sold DATE NOT NULL,
    agent_id INTEGER NOT NULL,
    commission REAL NOT NULL,
    FOREIGN KEY(house_id) REFERENCES houses(house_id),
    FOREIGN KEY(agent_id) REFERENCES estate_agents(agent_id)
);

-- Table for commissions 
CREATE TABLE commissions (
commission_id INTEGER PRIMARY KEY,
sale_id INTEGER NOT NULL,
agent_id INTEGER NOT NULL,
month INTEGER NOT NULL, 
year INTEGER NOT NULL,
commission REAL NOT NULL,
FOREIGN KEY (sale_id) REFERENCES sales(sale_id)
); 


-- I received help with brainstorming the appropriate listing category 