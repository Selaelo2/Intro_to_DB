import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Connect to MySQL server (without specifying a database)
        connection = mysql.connector.connect(
            host='localhost',          # Update with your MySQL server host if needed
            user='root',               # Update with your MySQL user
            password='password'        # Update with your MySQL password
        )
        
        if connection.is_connected():
            print("Connected to MySQL server successfully!")

            # Create a cursor to execute queries
            cursor = connection.cursor()
            
            # Create the database if it doesn't exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            
            # Commit the transaction
            connection.commit()
            print("Database 'alx_book_store' created successfully!")
            
            # Close the cursor and connection
            cursor.close()
            connection.close()
    
    except Error as e:
        print(f"Error: {e}")
        
    finally:
        if connection.is_connected():
            connection.close()
            print("MySQL connection is closed.")

# Run the function to create the database
create_database()
