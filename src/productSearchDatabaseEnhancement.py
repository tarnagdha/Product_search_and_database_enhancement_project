import sys
sys.path.append("C:/Users/HP/Desktop/Project_2")

import mysql.connector as mc

from services.dbConnection import dbconnection

from services.cursor import executeQuery

from services.dbConnection import dbconnection

from config import connection_parameters

from tabulate import tabulate



print("""Recherche de Produit.
Indication: Le nom de produit doit comporter au moins trois lettre""")
caractereSpeciaux = ["@", "%", "<","$", "&", "_", "-", "!", "#", "/", "?", "µ", "*", "=", '"', "'"]

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
                    Query_research =f"""
                    SELECT title, stock, price, c.name, created_at
                    
                    FROM product as p
                    
                    INNER JOIN category as c ON c.id = p.id_category

                    WHERE title like "%{research}%" OR description like "%{research}%" 
                    
                    """

                    #Connexion à la base de donnée et matching de la recherche
                    objectConnection = dbconnection(mc, connection_parameters)
                    results = executeQuery(objectConnection, Query_research, "show")
                    
                    #Verification du nombre de lettres rentré par user
                    number_results = len(results)

                    if number_results < 1 :
                        print("Aucun resultat")

                    else :
                        print(f"Nous avous trouvé {number_results} resultat(s) !" )
                        
                        #Affichage du resultat sous forme tableau dans la console
                        headers_names = ["title", "stock", "price", "category", "created_at"]
                        tableau_results = tabulate(results, headers_names, tablefmt='fancy_grid')
                        
                        print(tableau_results)

            except ValueError:
                print ("Recherche invalide.")

            
        
    