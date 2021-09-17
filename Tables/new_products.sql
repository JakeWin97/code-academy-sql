-- @block create new products table

CREATE TABLE CodeAcademy.product (
	product_id SERIAL PRIMARY KEY,
	product_name TEXT,
	selling_price REAL,
	category INTEGER,
    img TEXT
);