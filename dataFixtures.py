import json

import random

from datetime import datetime, timedelta

import unicodedata

from dbConnection import dbconnection

from cursor import executeQuery

from config import connection_parameters

import mysql.connector as mc

print("Ouvrons le fichier JSON")
with open('products.json') as file :
    print("charger les données JSON")
    jsonFile = file.read()


products_list = json.loads(jsonFile)

rows = []

for keys, products in products_list.items() :

    id_category = 1

    if keys == "alimentaire" :
        id_category = 1
    elif keys == "electronique" :
        id_category = 2
    elif keys == "vetement" :
        id_category = 3

    for index, product in  enumerate(products) :
        
        title = product["nom"]
        product_description = product["description"]
        stock = random.randint(0,200)
        today = datetime.now()
        my_date = today - timedelta(days = random.randint(1,30)) 
        
        created_at = my_date.strftime('%Y-%m-%d %H:%M:%S')      
        
        row = (title, stock, product_description, created_at, id_category)
        
      
        rows.append(row)

print(rows)    

truncate_query = "TRUNCATE TABLE product;"

query = "INSERT INTO product(title, stock, description, created_at, id_category) VALUES (%s, %s, %s, %s, %s)"


#execute the truncate table query
objectConnection = dbconnection(mc, connection_parameters)
executeQuery(objectConnection, truncate_query, "edit")


#execute the insert into query with the data
objectConnection = dbconnection(mc, connection_parameters)
executeQuery(objectConnection, query, "edit", rows)

