
def generateExcel(arrayresults, pandas_object, columns_names, pathFile):
    

    print("intialisation du dataframe")
    dataframe = pandas_object.DataFrame(arrayresults, columns = columns_names)

    print("importer les resultats sous format excel")
    dataframe.to_excel(pathFile)
