import mysql.connector
import collections

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  database="ita"
)
if mydb.is_connected():
        db_Info = mydb.get_server_info()
        print("Connected to MySQL Server version ", db_Info)
        mycursor = mydb.cursor()
        mycursor.execute("select database();")
        record = mycursor.fetchone()
        #print("You're connected to database: ", record)

#mycursor = mydb.cursor()
mycursor.execute("SELECT username FROM reviews WHERE reviews.fake=0;")

myresult = mycursor.fetchall()
X=[item for item, count in collections.Counter(myresult).items() if count > 1]  
for x in X:
    #print(x)
    #cursor1 = mydb.cursor()
    mycursor.execute("SELECT pid FROM reviews WHERE username='"+x[0]+"';")
    res1=mycursor.fetchall()
    Y=[item for item, count in collections.Counter(res1).items() if count > 1]
    for y in Y:
        #cursor2 = mydb.cursor()
        #cursor2.execute("SELECT ip FROM reviews WHERE pid='"+y[0]+"';")
        #res2=cursor2.fetchall()
        #z=[item for item, count in collections.Counter(res2).items() if count > 1]
        #cursor3 = mydb.cursor()
        mycursor.execute("UPDATE reviews SET fake=1 WHERE reviews.pid="+str(y[0])+" AND reviews.username='"+x[0]+"';")
        mydb.commit()
        print(mycursor.rowcount, "record(s) affected")
        #for z in z:
            #print(z)
            #cursor3 = mydb.cursor()
            #cursor3.execute("UPDATE reviews SET fake=true WHERE pid='"+y[0]+"' AND username='"+x[0]+"';")
mycursor.close()
mydb.close()  
