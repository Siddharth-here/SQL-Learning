CREATE TABLE canteen_menu(
    item_id SERIAL PRIMARY KEY,
    item_name VARCHAR(100),
    category VARCHAR(50),
    price INT,
    is_available BOOLEAN DEFAULT TRUE
)


INSERT INTO canteen_menu (item_name, category, price, is_available) VALUES
('Chicken Rice',       'Main',     450, TRUE),
('Fried Rice',         'Main',     400, TRUE),
('Laksa',              'Noodles',  550, FALSE),
('Wonton Mee',         'Noodles',  480, TRUE),
('Fish & Chips',       'Western',  650, TRUE),
('Chicken Chop',       'Western',  580, TRUE),
('Nasi Lemak',         'Malay',    350, TRUE),
('Mee Rebus',          'Malay',    420, FALSE),
('Roti Prata',         'Indian',   250, TRUE),
('Briyani Rice',       'Indian',   600, TRUE),
('Ice Lemon Tea',      'Drinks',   150, TRUE),
('Milo',               'Drinks',   180, FALSE),
('Chendol',            'Dessert',  300, TRUE),
('Ice Kacang',         'Dessert',  320, TRUE),
('Curry Puff',         'Snacks',   200, FALSE);

SELECT * FROM canteen_menu;

UPDATE canteen_menu SET price = 1000 WHERE  item_id = 1

UPDATE canteen_menu SET price = price -5  WHERE  category = 'Drinks'

UPDATE canteen_menu SET is_available = FALSE WHERE item_name = 'Chicken Chop'

DELETE FROM canteen_menu WHERE item_name = 'Mee Rebus'