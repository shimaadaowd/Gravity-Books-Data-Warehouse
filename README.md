# Gravity Books Data Warehouse

Gravity Bookstore is a database for a fictional bookstore called "Gravity Books" that captures information about books, customers, and sales.

![image](https://github.com/shimaadaowd/Gravity-Books-Data-Warehouse/assets/81235048/c1977171-9efb-4f41-8579-65352018620c)

The objective of this project is to create a Data Warehouse for a fictional bookstore called: "Gravity Books", and design an SSIS project to populate the data from ‘gravity_books’ transactional database into the new target data warehouse ‘gravity_books_dwh’.

# Tables description:

•	book: a list of all books available in the store.

•	book_author: stores the authors for each book, which is a many-to-many relationship.

•	author: a list of all authors.

•	book_language: a list of possible languages of books.

•	publisher: a list of publishers for books.

•	customer: a list of the customers of the Gravity Bookstore.

•	customer_address: a list of addresses for customers, as a customer can have more than one address, and an address has more than one customer.

•	address_status: a list of statuses for an address, because addresses can be current or old.

•	address: a list of addresses in the system.

•	country: a list of countries that addresses are in.

•	cust_order: a list of orders placed by customers.

•	order_line: a list of books that are a part of each order.

•	shipping_method: the possible shipping methods for an order.

•	order_history: the history of an order, such as ordered, cancelled, delivered.

•	order_status: the possible statuses of an order.


# Requirements:
For this data warehouse project we need to accomplish the following:

1.	Model and develop the ‘gravity_books" Data Warehouse, Providing the DDL statements of table creation and a screenshot from the DWH ERD.
   
2.	Define which approach (star schema, snowflake) of data warehouse used in our solution, and why.
   We used the "star schema" approach as it suited the business requirements.
  	
3.	Define a method to check and maintain the integrity between the fact and the dimensions (SQL).

   
4.	Add a date dimension to the system to track the historical changes.
	
5.	Design an SSIS project to populate the data from ‘gravity_books’ transactional database into the new target data warehouse ‘gravity_books_dwh’.



# The following are provided for the project:

• Screenshots for the output.

• The solution files:

      o	DWH DDL statements (format .sql)
      
      o	ETL SSIS project
      
      o	OLAP SSAS project
      
      o	Mapping Sheet


# Reference:

The project's database is originally downloaded from this link:<br>
https://github.com/bbrumm/databasestar/tree/main/sample_databases/sample_db_gravity/gravity_sqlserver



