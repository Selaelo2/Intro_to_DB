-- Drop the database if it already exists
IF DB_ID('alx_book_store') IS NOT NULL
BEGIN
    DROP DATABASE alx_book_store;
END
GO

-- Create the database
CREATE DATABASE alx_book_store;
GO

-- Use the database
USE alx_book_store;
GO

-- Create the Authors table if it doesn't exist
IF OBJECT_ID('Authors', 'U') IS NULL
BEGIN
    CREATE TABLE Authors (
        author_id INT IDENTITY(1,1) PRIMARY KEY,
        author_name NVARCHAR(215) NOT NULL
    );
END
GO

-- Create the Books table if it doesn't exist
IF OBJECT_ID('Books', 'U') IS NULL
BEGIN
    CREATE TABLE Books (
        book_id INT IDENTITY(1,1) PRIMARY KEY,
        title NVARCHAR(130) NOT NULL,
        author_id INT,
        price DECIMAL(10, 2) NOT NULL,
        publication_date DATE,
        FOREIGN KEY (author_id) REFERENCES Authors(author_id)
    );
END
GO

-- Create the Customers table if it doesn't exist
IF OBJECT_ID('Customers', 'U') IS NULL
BEGIN
    CREATE TABLE Customers (
        customer_id INT IDENTITY(1,1) PRIMARY KEY,
        customer_name NVARCHAR(215) NOT NULL,
        email NVARCHAR(215) NOT NULL,
        address NVARCHAR(MAX) NOT NULL
    );
END
GO

-- Create the Orders table if it doesn't exist
IF OBJECT_ID('Orders', 'U') IS NULL
BEGIN
    CREATE TABLE Orders (
        order_id INT IDENTITY(1,1) PRIMARY KEY,
        customer_id INT,
        order_date DATE NOT NULL,
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
    );
END
GO

-- Create the Order_Details table if it doesn't exist
IF OBJECT_ID('Order_Details', 'U') IS NULL
BEGIN
    CREATE TABLE Order_Details (
        orderdetailid INT IDENTITY(1,1) PRIMARY KEY,
        order_id INT,
        book_id INT,
        quantity DECIMAL(10, 2) NOT NULL,
        FOREIGN KEY (order_id) REFERENCES Orders(order_id),
        FOREIGN KEY (book_id) REFERENCES Books(book_id)
    );
END
GO