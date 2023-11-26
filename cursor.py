import mysql.connector as mc

from mysql.connector import Error

from config import connection_parameters



def executeQuery(object_connection, query, mode="show"):       
    if object_connection == None :
        return [] 
    
    print("recuperation du curseur")
    cursor = object_connection.cursor()

    print("execution de la requete")
    cursor.execute(query)
    
    if mode == "show" :
        print("Recuperation du resultat")
        results = cursor.fetchall()

        cursor.close()
        object_connection.close()

        return results

    cursor.close()
    object_connection.close()
        

