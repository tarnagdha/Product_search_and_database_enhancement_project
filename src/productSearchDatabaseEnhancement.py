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

def countResult (research) :
    #Requete de matching de la recherche
    Query_research =f"""
    SELECT COUNT(id)
    
    FROM product
    
    WHERE title like "%{research}%" OR description like "%{research}%" 

    """
    #Connexion à la base de donnée et matching de la recherche
    objectConnection = dbconnection(mc, connection_parameters)
    results = executeQuery(objectConnection, Query_research, "show")

    if len(results) > 0 :
        return results[0][0]
    
    return 0


def researchWord(word,limit, offset) :

    #Requete de matching de la recherche
    Query_research =f"""
    SELECT title, stock, price, c.name, created_at
    
    FROM product as p
    
    INNER JOIN category as c ON c.id = p.id_category

    WHERE title like "%{word}%" OR description like "%{word}%" 

    ORDER BY title ASC

    LIMIT {limit}

    OFFSET {offset}
    
    """

    #Connexion à la base de donnée et matching de la recherche
    objectConnection = dbconnection(mc, connection_parameters)
    results = executeQuery(objectConnection, Query_research, "show")

    return results

caractereSpeciaux = ["@", "%", "<","$", "&", "_", "-", "!", "#", "/", "?", "µ", "*", "=", '"', "'"]

print("Recherche de Produit.\nIndication: Le nom de produit doit comporter au moins trois lettres.") 
print(f"Les caratères suivants ne sont pas autorisés: {caractereSpeciaux}\n")

      

while True:
    research = input("Rentrez une recherche ou rentrez sur Q pour quitter \n> ")
    
    if research.lower() == "q":
        break  


    
    else:
        #Ecriture de la rentrée user sous forme de liste(decomposition lettre par lettre)
        list_research = list(research) 

        #Verification du nombre de lettres rentré par l'utilisateur
        if len(list_research) < 3 :
            print("Rentrez invalide. Veuillez rentrer au moins 3 lettres >")
      
        else :
            
            try :                      
                #Verification de correspondance de liste par la Methode d'intersection des ensembles
                ##Transformation des listes en ensemble
                set_1 = set(caractereSpeciaux)
                set_2 = set(list_research)

                ##intersection des ensemble
                intersection = list(set_1 & set_2)

                if len(intersection) > 0 :
                    print("Rentrez invalide. Veuillez eviter les caractères spéciaux.")

                else:                        
                    LIMIT = 5
                    offset = 0
                    total_results = countResult(research)

                    if total_results < 1:
                        print("\n<<< Aucun résultat >>>\n")
                    else:
                        print(f"Nous avons trouvé {total_results} résultat(s) !")

                        pagination = "p"

                        while offset < total_results:
                            if pagination not in ['s', 'p']:
                                break

                            results = researchWord(research, LIMIT, offset)
                            headersNames = ["title", "stock", "price", "category", "created_at"]
                            table_results = tabulate(results, headersNames, tablefmt='fancy_grid')
                            print(table_results)

                            while True:
                                entry = input("Rentrez S pour suivant, P pour précédent, ou une autre lettre pour sortir\n > ")
                                pagination = entry.lower()

                                if pagination == "s" and offset + LIMIT < total_results:
                                    offset += LIMIT
                                    break
                                elif pagination == "p" and offset - LIMIT >= 0:
                                    offset -= LIMIT
                                    break
                                elif pagination not in ['s', 'p']:
                                    break

                        #Question the user if he need to generate the results excel file
                        print("Voulez vous generer les resulats sous format excel ?")
                        generate_results_file = input("oui / non  \n>")

                        if generate_results_file.lower() == "oui" :
                            fullResults = researchWord(research, total_results, 0)

                            basePath = createFolder(os, "C:/Users/HP/Desktop/Project_2/results")
                            currentTime = currentDateToMicroSecond(time)
                            filePath = basePath + "/data_" +currentTime + ".xlsx" 
                            generateExcel(fullResults, pd, headersNames, filePath)


            except ValueError:
                print("Recherche invalide.")

            