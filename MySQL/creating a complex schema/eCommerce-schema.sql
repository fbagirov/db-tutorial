DROP SCHEMA IF EXISTS eCommerce;
CREATE SCHEMA eCommerce;
USE eCommerce;

CREATE TABLE customer (
	cust_id INT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	dob DATE NOT NULL,
	gender VARCHAR(1) NOT NULL,
	primary_address INT,
	primary_phone INT,
	primary_email INT,
	primary_payment INT
    );
    
CREATE TABLE phone (
phone_id INT PRIMARY KEY,
cust_id INT NOT NULL,
country_code INT NOT NULL,
area_code INT NOT NULL,
phone_number INT NOT NULL,
extention INT,
phone_type VARCHAR(8) NOT NULL,
primary_phone BOOLEAN NOT NULL DEFAULT FALSE,
FOREIGN KEY(cust_id) REFERENCES customer(cust_id) ON DELETE CASCADE
);

ALTER TABLE customer
ADD FOREIGN KEY(primary_phone)
REFERENCES phone(phone_id)
ON DELETE CASCADE;


CREATE TABLE email (
email_id INT PRIMARY KEY,
cust_id INT NOT NULL,
email VARCHAR(254) NOT NULL,
email_type VARCHAR(10) NOT NULL,
primary_email BOOLEAN NOT NULL DEFAULT FALSE,
FOREIGN KEY(cust_id) REFERENCES customer(cust_id) ON DELETE CASCADE
);

ALTER TABLE customer
ADD FOREIGN KEY(primary_email)
REFERENCES email(email_id)
ON DELETE CASCADE;


CREATE TABLE payment (
payment_id INT PRIMARY KEY,
cust_id INT NOT NULL,
cc_number VARCHAR(16) NOT NULL,
cc_type VARCHAR(20) NOT NULL,
cc_name_different VARCHAR(100),
cc_exp_month INT NOT NULL,
cc_exp_year INT NOT NULL,
cc_sec_code INT NOT NULL,
primary_payment BOOLEAN NOT NULL DEFAULT FALSE,
FOREIGN KEY(cust_id) REFERENCES customer(cust_id) ON DELETE CASCADE
);

ALTER TABLE customer
ADD FOREIGN KEY(primary_payment)
REFERENCES payment(payment_id)
ON DELETE CASCADE;


CREATE TABLE address (
address_id INT PRIMARY KEY,
cust_id INT NOT NULL,
address VARCHAR(95) NOT NULL,
apt_suite VARCHAR(10),
city VARCHAR(35) NOT NULL,
state VARCHAR(2) NOT NULL,
zip_code INT NOT NULL,
country VARCHAR(74) NOT NULL,
address_type VARCHAR(8) NOT NULL,
primary_address BOOLEAN NOT NULL DEFAULT FALSE,
FOREIGN KEY(cust_id) REFERENCES customer(cust_id) ON DELETE CASCADE
);

ALTER TABLE customer
ADD FOREIGN KEY(primary_address)
REFERENCES address(address_id)
ON DELETE CASCADE;


CREATE TABLE order_details (
order_id INT PRIMARY KEY,
cust_id INT NOT NULL,
cart_id INT,
payment_id INT NOT NULL,
payment_date DATE,
order_date DATE NOT NULL,
ship_date DATE,
ship_method VARCHAR(30) NOT NULL,
fullfillment_date DATE,
cancellation_date DATE,
return_date DATE,
FOREIGN KEY(cust_id) REFERENCES customer(cust_id) ON DELETE CASCADE,
FOREIGN KEY(payment_id) REFERENCES payment(payment_id) ON DELETE CASCADE
);

CREATE TABLE cart (
cart_id INT PRIMARY KEY,
order_id INT NOT NULL,
product_id INT,
quantity INT NOT NULL,
discount INT,
FOREIGN KEY(order_id) REFERENCES order_details(order_id) ON DELETE CASCADE
);

ALTER TABLE order_details
ADD FOREIGN KEY(cart_id)
REFERENCES cart(cart_id)
ON DELETE CASCADE;


CREATE TABLE product_catalog (
product_id INT PRIMARY KEY,
product_name VARCHAR(50) NOT NULL,
vendor_id INT NOT NULL,
manufacturer_id VARCHAR(10) NOT NULL,
color_id INT,
size_id INT,
unit_id INT,
price_per_unit INT,
weight_per_unit INT
);

ALTER TABLE cart
ADD FOREIGN KEY(product_id)
REFERENCES product_catalog(product_id)
ON DELETE CASCADE;


# create a relationship with a vendor table, manufacturer table, color table, size, and unit tables.

