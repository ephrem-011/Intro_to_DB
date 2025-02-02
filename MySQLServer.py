import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Connect to MySQL server (not specifying a database yet)
        connection = mysql.connector.connect(
            host='localhost',  # Replace with your MySQL server host if necessary
            user='root',       # Replace with your MySQL username
            password='password'  # Replace with your MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()

            # SQL query to create the database if it doesn't already exist
            create_db_query = "CREATE DATABASE IF NOT EXISTS alx_book_store"

            # Execute the query
            cursor.execute(create_db_query)

            # Commit the transaction (although not necessary for CREATE DATABASE)
            connection.commit()

            print("Database 'alx_book_store' created successfully!")

    except Error as e:
        print(f"Error: {e}")

    finally:
        # Close the connection if it's open
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection closed.")

if __name__ == "__main__":
    create_database()
