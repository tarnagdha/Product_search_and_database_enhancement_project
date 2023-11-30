import pandas as pd

import os

import time

import mysql.connector as mc

import sys
sys.path.append("C:/Users/HP/Desktop/Project_2")

from generate_excel import generateExcel
from services.dbConnection import dbconnection
from services.cursor import executeQuery
from services.dbConnection import dbconnection
from services.utils import currentDateToMicroSecond, createFolder
from config import connection_parameters
from tabulate import tabulate




caractereSpeciaux = ["@", "%", "<","$", "&", "_", "-", "!", "#", "/", "?", "µ", "*", "=", '"', "'"]

print("Recherche de Produit.\nIndication: Le nom de produit doit comporter au moins trois lettres.") 
print(f"Les caratères suivants ne sont pas autorisés: {caractereSpeciaux}\n")

      

while True:
    research = input("Rentrez une recherche ou rentrez sur Q pour quitter \n> ")
    
    if research.lower() == "q":
        break  


    
    else:
        #Ecriture de la rentrée user sous forme de liste
        list_research = list(research) 


        if len(list_research) < 3 :
            print("Rentrez invalide. Veuillez rentrer au moins lettres >")
      
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
                        print("\n<<< Aucun resultat >>> \n")

                    else :
                        print(f"Nous avous trouvé {number_results} resultat(s) !" )
                        
                        #Affichage du resultat sous forme tableau dans la console
                        headersNames = ["title", "stock", "price", "category", "created_at"]
                        table_results = tabulate(results, headersNames, tablefmt='fancy_grid')
                        
                        print(table_results)                   

                        #Question the user if he need to generate the results excel file
                        print("Voulez vous generer les resulats sous format excel ?")
                        generate_results_file = input("oui / non  \n>")

                        if generate_results_file.lower() == "oui" :
                           
                           basePath = createFolder(os, "C:/Users/HP/Desktop/Project_2/results")
                           currentTime = currentDateToMicroSecond(time)
                           filePath = basePath + "/data_" +currentTime + ".xlsx" 


                           generateExcel(results, pd, headersNames, filePath)
                    
            except ValueError:
                print ("Recherche invalide.")

            
        
