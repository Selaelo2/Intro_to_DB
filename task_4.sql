-- Use the database passed as an argument
USE alx_book_store;

-- Query the information schema for the books table details
SELECT COLUMN_NAME,
       DATA_TYPE,
       CHARACTER_MAXIMUM_LENGTH AS max_length,
       IS_NULLABLE,
       COLUMN_DEFAULT,
       COLUMN_KEY
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'alx_book_store' 
  AND TABLE_NAME = 'Books';
