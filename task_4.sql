-- Use the database passed as an argument
USE alx_book_store;

-- Query the information schema for the books table details
SELECT COLUMN_NAME,
       COLUMN_TYPE,              -- Shows the full data type (e.g., VARCHAR(130))
       IS_NULLABLE,
       COLUMN_DEFAULT,
       COLUMN_KEY
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'alx_book_store' 
  AND TABLE_NAME = 'Books';
