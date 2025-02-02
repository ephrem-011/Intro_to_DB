-- Query the INFORMATION_SCHEMA to get the full description of the 'Books' table
SELECT COLUMN_NAME, COLUMN_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'alx_book_store'  -- Filter by database name
AND TABLE_NAME = 'Books';              -- Filter by table name
