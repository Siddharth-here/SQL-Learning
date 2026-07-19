CREATE TABLE smart_watch_sales(
    sale_id SERIAL PRIMARY KEY,
    brand VARCHAR(50),
    model VARCHAR(100),
    units_sold INT, 
    price_per_unit DECIMAL(10,2),
    sale_date DATE
)
ALTER TABLE smart_watch_sales
ADD COLUMN city VARCHAR(100);

INSERT INTO smart_watch_sales (brand, model, units_sold, price_per_unit, sale_date) VALUES
('Apple',     'Watch Series 9',     120,  599.00, '2025-11-01'),
('Apple',     'Watch Ultra 2',       45,  899.00, '2025-11-02'),
('Samsung',   'Galaxy Watch 6',      85,  399.00, '2025-11-03'),
('Samsung',   'Galaxy Watch 6 Classic', 50, 469.00, '2025-11-04'),
('Garmin',    'Venu 3',              30,  549.99, '2025-11-05'),
('Garmin',    'Forerunner 265',      25,  499.99, '2025-11-06'),
('Fitbit',    'Versa 4',             70,  299.95, '2025-11-07'),
('Fitbit',    'Charge 6',            95,  179.95, '2025-11-08'),
('Xiaomi',    'Mi Watch 2',         110,  199.99, '2025-11-09'),
('Huawei',    'Watch GT 4',          40,  349.00, '2025-11-10'),
('Apple',     'Watch SE (2nd gen)',  90,  349.00, '2025-11-11'),
('Samsung',   'Galaxy Watch 5',      55,  299.99, '2025-11-12'),
('Garmin',    'Fenix 7X',            20,  699.99, '2025-11-13'),
('Xiaomi',    'Band 8 Pro',         150,   69.99, '2025-11-14'),
('Amazfit',   'Balance',             35,  229.99, '2025-11-15');

UPDATE smart_watch_sales SET city = CASE sale_id
    WHEN 1  THEN 'Mumbai'
    WHEN 2  THEN 'Delhi'
    WHEN 3  THEN 'Bangalore'
    WHEN 4  THEN 'Hyderabad'
    WHEN 5  THEN 'Chennai'
    WHEN 6  THEN 'Kolkata'
    WHEN 7  THEN 'Pune'
    WHEN 8  THEN 'Ahmedabad'
    WHEN 9  THEN 'Jaipur'
    WHEN 10 THEN 'Lucknow'
    WHEN 11 THEN 'Surat'
    WHEN 12 THEN 'Bhopal'
    WHEN 13 THEN 'Chandigarh'
    WHEN 14 THEN 'Indore'
    WHEN 15 THEN 'Coimbatore'
END;


SELECT COUNT(*) as total_rows FROM smart_watch_sales;

SELECT SUM (units_sold * price_per_unit) as total_revenue FROM smart_watch_sales 

SELECT AVG (price_per_unit) AS avg_price_unit FROM smart_watch_sales

SELECT MIN (price_per_unit) AS chepest FROM smart_watch_sales

SELECT MAX (price_per_unit) AS costly FROM smart_watch_sales


SELECT * FROM smart_watch_sales

--  Group by

SELECT brand, SUM(units_sold) AS total_unit_sold FROM smart_watch_sales GROUP BY brand

SELECT city, SUM(units_sold * price_per_unit) as city_revenue FROM smart_watch_sales GROUP BY city ORDER BY city_revenue DESC

SELECT city, brand, SUM(units_sold) AS units FROM smart_watch_sales GROUP BY city, brand