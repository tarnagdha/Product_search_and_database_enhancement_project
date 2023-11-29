from mysql.connector import Error


def executeQuery(object_connection, query, mode="show", rows = None):       
    if object_connection == None :
        return [] 
    
    print("recuperation du curseur")
    cursor = object_connection.cursor()


    print("execution de la requete")
    if rows != None :
        cursor.executemany(query, rows)
    else : 
        cursor.execute(query)
    

    if mode == "show" :
        print("Recuperation du resultat")
        results = cursor.fetchall()

        cursor.close()
        object_connection.close()

        return results
    
    object_connection.commit()
    cursor.close()
    object_connection.close()
        

