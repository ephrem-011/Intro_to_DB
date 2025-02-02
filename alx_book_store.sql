-- Creating the database if it does not already exist
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- Using the created database
USE alx_book_store;

-- Creating the Authors table
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- Creating the Books table
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Creating the Customers table
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE,
    address TEXT NOT NULL
);

-- Creating the Orders table
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Creating the Order_Details table
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Sample Insert Statements (optional)
-- Adding authors
INSERT INTO Authors (author_name) VALUES ('J.K. Rowling');
INSERT INTO Authors (author_name) VALUES ('George Orwell');

-- Adding books
INSERT INTO Books (title, author_id, price, publication_date) 
VALUES ('Harry Potter and the Philosopher\'s Stone', 1, 19.99, '1997-06-26');
INSERT INTO Books (title, author_id, price, publication_date) 
VALUES ('1984', 2, 14.99, '1949-06-08');

-- Adding customers
INSERT INTO Customers (customer_name, email, address) 
VALUES ('Alice Johnson', 'alice@example.com', '123 Book St, Booktown');
INSERT INTO Customers (customer_name, email, address) 
VALUES ('Bob Smith', 'bob@example.com', '456 Novel Ave, Story City');

-- Adding orders
INSERT INTO Orders (customer_id, order_date) 
VALUES (1, '2025-02-02');
INSERT INTO Orders (customer_id, order_date) 
VALUES (2, '2025-02-02');

-- Adding order details
INSERT INTO Order_Details (order_id, book_id, quantity) 
VALUES (1, 1, 2); -- Alice ordered 2 copies of 'Harry Potter'
INSERT INTO Order_Details (order_id, book_id, quantity) 
VALUES (2, 2, 1); -- Bob ordered 1 copy of '1984'
