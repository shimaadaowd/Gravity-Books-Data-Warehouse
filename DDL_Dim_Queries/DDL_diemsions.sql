---- creating Dimension customer table 
CREATE TABLE Dim_Customer (
	customer_SK INT IDENTITY(1, 1) PRIMARY KEY,
	customer_id INT,
	first_name VARCHAR(200),
	last_name VARCHAR(200),
	email VARCHAR(350),
	address_status VARCHAR(30),
	street_number VARCHAR(10),
	street_name VARCHAR(200),
	city VARCHAR(100),
	country VARCHAR(200),
	start_date DATETIME,
	end_date DATETIME,
	is_current TINYINT
)

----creating Dimension book table 
CREATE TABLE Dim_Book (
	book_SK INT IDENTITY(1, 1) PRIMARY KEY,
	book_id INT,
	title VARCHAR(400),
	isbn13 VARCHAR(50),
	language_code VARCHAR(400),
	language_name VARCHAR(400),
	num_pages INT,
	publication_date DATE,
	publication_name VARCHAR(400),
	author_name VARCHAR(400),
	source_system_code TINYINT,
	start_date DATETIME,
	end_date DATETIME,
	is_current TINYINT
)

----creating Dimension shipping table 
CREATE TABLE Dim_Shipping (
	shipping_SK INT IDENTITY(1, 1) PRIMARY KEY,
	shipping_id INT,
	shipping_method VARCHAR(100),
	start_date DATETIME,
	end_date DATETIME,
	is_current TINYINT
)


