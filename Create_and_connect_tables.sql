CREATE DATABASE Manufacturer
USE Manufacturer


CREATE SCHEMA Product
CREATE SCHEMA Supplier

CREATE TABLE Product.Product(
	prod_id INT PRIMARY KEY,
	prod_name VARCHAR(50),
	quantity INT);

CREATE TABLE Product.Prod_Comp(
	prod_id INT,
	comp_id INT, 
	quantity_comp INT,
	PRIMARY KEY(prod_id, comp_id));

CREATE TABLE Product.Component(
	comp_id INT PRIMARY KEY,
	comp_name VARCHAR(50),
	description VARCHAR(50),
	quantity_comp INT);

CREATE TABLE Supplier.Comp_Supp(
	supp_id INT,
	comp_id INT,
	order_date DATE,
	quantity INT,
	PRIMARY KEY(supp_id, comp_id));

CREATE TABLE Supplier.Supplier(
	supp_id INT PRIMARY KEY,
	supp_name VARCHAR(50),
	supp_location VARCHAR(50),
	supp_country VARCHAR(50),
	is_active BIT);


ALTER TABLE Product.Prod_Comp
ADD CONSTRAINT FK1 FOREIGN KEY (prod_id) REFERENCES Product.Product

ALTER TABLE Product.Prod_Comp
ADD CONSTRAINT FK2 FOREIGN KEY (comp_id) REFERENCES Product.Component

ALTER TABLE Supplier.Comp_Supp
ADD CONSTRAINT FK1 FOREIGN KEY (supp_id) REFERENCES Supplier.Supplier

ALTER TABLE Supplier.Comp_Supp
ADD CONSTRAINT FK2 FOREIGN KEY (comp_id) REFERENCES Product.Component