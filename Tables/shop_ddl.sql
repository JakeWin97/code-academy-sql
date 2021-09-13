-- @block create schema 
CREATE SCHEMA CodeAcademy;


-- @block customer definition

CREATE TABLE CodeAcademy.customer (
	customer_id INTEGER,
	customer_name TEXT,
	email TEXT,
	phone_number TEXT,
	address_line_1 TEXT,
	city TEXT
);

-- @block "order" definition

CREATE TABLE CodeAcademy."order" (
	order_id INTEGER,
	customer_id INTEGER,
	order_date TEXT,
	total_amount REAL,
	order_status_id INTEGER
);

-- @block order_line definition

CREATE TABLE CodeAcademy.order_line (
	order_line_id INTEGER,
	order_id INTEGER,
	product_id INTEGER,
	quantity INTEGER
);

-- @block order_status definition

CREATE TABLE CodeAcademy.order_status (
	order_status_id INTEGER,
	status_name TEXT
);

-- @block product definition

CREATE TABLE CodeAcademy.product (
	product_id INTEGER,
	product_name TEXT,
	selling_price REAL,
	cost_price REAL
);