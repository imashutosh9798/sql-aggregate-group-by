-- 1 The laptops table
CREATE TABLE laptops (
    laptop_id INTEGER PRIMARY KEY,       -- use AUTOINCREMENT in SQLite or AUTO_INCREMENT in MySQL
    brand TEXT NOT NULL,
    model TEXT NOT NULL,
    price DECIMAL(10,2) NOT NULL,       -- price in your currency
    ram_gb INTEGER NOT NULL,
    storage_gb INTEGER NOT NULL,
    storage_type TEXT NOT NULL,         -- e.g., SSD, HDD
    processor TEXT,
    release_date DATE,
    os TEXT
);

-- 2) Insert sample data
INSERT INTO laptops (laptop_id, brand, model, price, ram_gb, storage_gb, storage_type, processor, release_date, os) VALUES
(1,  'Dell',     'XPS 13',        1199.00, 16, 512, 'SSD', 'Intel i7-1165G7', '2021-03-10', 'Windows 10'),
(2,  'Apple',    'MacBook Air M1',999.00, 8, 256, 'SSD', 'Apple M1',        '2020-11-17', 'macOS'),
(3,  'HP',       'Spectre x360',  1299.50,16, 512, 'SSD', 'Intel i7-1165G7', '2021-01-25', 'Windows 10'),
(4,  'Lenovo',   'ThinkPad X1',   1399.99,16, 1024,'SSD', 'Intel i7-1165G7', '2021-05-05', 'Windows 10'),
(5,  'Asus',     'ROG Zephyrus',  1799.00,32, 1000,'SSD', 'AMD Ryzen 9',     '2021-04-02', 'Windows 10'),
(6,  'Acer',     'Swift 3',       699.00, 8, 256, 'SSD', 'AMD Ryzen 5',     '2020-09-10', 'Windows 10'),
(7,  'Microsoft','Surface Pro 7',  899.00, 8, 128, 'SSD', 'Intel i5-1035G4', '2019-10-02', 'Windows 10'),
(8,  'Apple',    'MacBook Pro 14',1999.00,16, 512, 'SSD', 'Apple M1 Pro',   '2021-10-18', 'macOS'),
(9,  'Dell',     'G15',           999.99,16, 512, 'SSD', 'Intel i5-11400H', '2021-06-15', 'Windows 10'),
(10, 'HP',       'Pavilion',      749.99, 8, 256, 'SSD', 'Intel i5-1135G7', '2021-02-20', 'Windows 10'),
(11, 'Lenovo',   'Ideapad 3',     549.99, 8, 512, 'SSD', 'AMD Ryzen 3',     '2020-08-10', 'Windows 10'),
(12, 'Asus',     'VivoBook',      629.00, 8, 256, 'SSD', 'Intel i3-1115G4', '2021-03-01', 'Windows 10');

----------------------------------------------------------------
-- Useful aggregate / grouping queries for the laptops table
----------------------------------------------------------------

-- A. Average price by brand
SELECT brand, ROUND(AVG(price), 2) AS avg_price, COUNT(*) AS num_models
FROM laptops
GROUP BY brand;

-- B. Count of laptops by RAM size
SELECT ram_gb, COUNT(*) AS count_laptops
FROM laptops
GROUP BY ram_gb
ORDER BY ram_gb;

-- C. Highest priced laptop for each brand
SELECT brand, model, price
FROM laptops AS L1
WHERE price = (
    SELECT MAX(price)
    FROM laptops AS L2
    WHERE L2.brand = L1.brand
);

-- D. Brands having average price greater than 1000 (HAVING)
SELECT brand, ROUND(AVG(price),2) AS avg_price
FROM laptops
GROUP BY brand
HAVING AVG(price) > 1000;

-- E. Total inventory value (sum of prices) and overall averages
SELECT ROUND(SUM(price),2) AS total_inventory_value,
       ROUND(AVG(price),2) AS overall_avg_price,
       MIN(price) AS min_price, MAX(price) AS max_price
FROM laptops;

-- F. Count distinct brands and distinct models
SELECT COUNT(DISTINCT brand) AS unique_brands,
       COUNT(DISTINCT model) AS unique_models
FROM laptops;

-- G. Group by brand and RAM (multi-column grouping)
SELECT brand, ram_gb, COUNT(*) AS models_with_ram, ROUND(AVG(price),2) AS avg_price
FROM laptops
GROUP BY brand, ram_gb
ORDER BY brand, ram_gb;

-- H. COUNT(*) vs COUNT(column)
SELECT COUNT(*) AS total_rows,
       COUNT(release_date) AS rows_with_release_date
FROM laptops;

-- I. Round average price to zero decimal places (example of ROUND)
SELECT brand, ROUND(AVG(price), 0) AS avg_price_rounded
FROM laptops
GROUP BY brand;

-- J. Example: filter groups by number of models (only brands with >= 2 models)
SELECT brand, COUNT(*) AS model_count, ROUND(AVG(price),2) AS avg_price
FROM laptops
GROUP BY brand
HAVING COUNT(*) >= 2;
