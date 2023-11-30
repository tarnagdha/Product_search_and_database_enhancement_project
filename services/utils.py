def currentDateToMicroSecond (current) :
    return str (round(current.time() * 1000))


def createFolder(os, pathDos):
    if not os.path.exists(pathDos):
        os.makedirs(pathDos, exist_ok=True)
    return pathDos