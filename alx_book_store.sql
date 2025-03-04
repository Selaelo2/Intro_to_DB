-- Create the database
CREATE DATABASE alx_book_store;
GO

-- Use the database
USE alx_book_store;
GO

-- Create the Authors table
CREATE TABLE Authors (
    author_id INT IDENTITY(1,1) PRIMARY KEY,
    author_name NVARCHAR(215) NOT NULL
);
GO

-- Create the Books table
CREATE TABLE Books (
    book_id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(130) NOT NULL,
    author_id INT,
    price DECIMAL(10, 2) NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);
GO

-- Create the Customers table
CREATE TABLE Customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_name NVARCHAR(215) NOT NULL,
    email NVARCHAR(215) NOT NULL,
    address NVARCHAR(MAX) NOT NULL
);
GO

-- Create the Orders table
CREATE TABLE Orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
GO

-- Create the Order_Details table
CREATE TABLE Order_Details (
    orderdetailid INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
GO