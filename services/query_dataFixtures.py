import json

import random

from datetime import datetime, timedelta

import unicodedata

from dbConnection import dbconnection

from cursor import executeQuery

import mysql.connector as mc

import sys
sys.path.append("C:/Users/HP/Desktop/Project_2")
from config import connection_parameters


print("Ouvrons le fichier JSON")
with open('products.json') as file :
    print("charger les données JSON")
    jsonFile = file.read()


products_list = json.loads(jsonFile)

rows = ""

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
        price = random.uniform(5.0, 999999.0)

        row = f'("{title}", {stock}, "{product_description}", "{created_at}", {id_category}) '
        
        if index == len(products) - 1 and keys == "vetement":
            row += "; "
        else :
            row += ", "
        
        rows += row
        

query = "TRUNCATE TABLE product; INSERT INTO product(title, stock, description, created_at, id_category, price) VALUES " + rows

with open("query.sql", "w") as file :
    file.write(query)

