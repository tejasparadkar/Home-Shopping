import mysql.connector
from mysql.connector import Error
import collections

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  database="ita"
)
if mydb.is_connected():
        db_Info = mydb.get_server_info()
        print("Connected to MySQL Server version ", db_Info)
        cursor = mydb.cursor()
        cursor.execute("select database();")
        record = cursor.fetchone()
        print("You're connected to database: ", record)

mycursor = mydb.cursor()
mycursor.execute("alter table reviews add fake boolean;")

#mycursor.execute("SELECT username FROM reviews;")
cursor.close()
mycursor.close()
mydb.close()
