import sys
sys.path.append("C:/Users/HP/Desktop/Project_2")

import mysql.connector as mc

from services.dbConnection import dbconnection

from services.cursor import executeQuery

from services.dbConnection import dbconnection

from config import connection_parameters



print("""Recherche de Produit.
Indication: Le nom de produit doit comporter au moins trois lettre""")

caractereSpeciaux = ["@", "%", "à","ç", "&"]

while True:
    research = input("Rentrez une recherche ou appuyez sur Q pour quitter ")
    
    if research == "Q" :
        break  


    
    else:
        #Ecriture de la rentrée user sous forme de liste
        list_research = list(research) 


        if len(list_research) < 3 :
            print("Rentrez invalide. Veuillez rentrer au moins lettres")
      
        else :
            
            try :                      
                #Methode d'intersection des ensemble
                ##Transformation des listes en ensemble
                set_1 = set(caractereSpeciaux)
                set_2 = set(list_research)

                ##intersection des ensemble
                intersection = list(set_1 & set_2)

                if len(intersection) > 0 :
                    print("Rentrez invalide. Veuillez eviter les caractères spéciaux.")

                else: 
                    print(research)
                    
                    #Requete de matching de la recherche
                    Query_1 =(f"""SELECT * FROM product WHERE title like "%{research}%" OR description like "%{research}%" """)
                    Query_research = Query_1
                    print(Query_research)


                    #Connexion à la base de donnée et matching de la recherche
                    objectConnection = dbconnection(mc, connection_parameters)
                    results = executeQuery(objectConnection, Query_research, "show")
                    
                    number_results = len(results)

                    if number_results < 1 :
                        print("Aucun resultat")

                    else :
                        print(f"Nous avous {number_results} resultat(s) !" )
                        print(results)

            except ValueError:
                print ("Recherche invalide.")

            
        
    