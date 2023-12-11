import sys
sys.path.append("C:/Users/HP/Desktop/Project_2")

from sqlalchemy import create_engine
import pandas as pd

from config import dbinfo, port

from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import linear_kernel
from nltk.corpus import stopwords
import nltk
import os
import joblib  # Pour sauvegarder et charger le modèle

def train_tfidf_model(df, model_file_path):
    print("========Entrainement==============")
    # Télécharger les mots vides en français
    nltk.download('stopwords')

    # Utiliser les mots vides en français dans TfidfVectorizer
    stopWords = set(stopwords.words('french'))

    # Prétraitement des données et entraînement du modèle TF-IDF
    tfidf_vectorizer = TfidfVectorizer(stop_words=list(stopWords))
    tfidf_matrix = tfidf_vectorizer.fit_transform(df['title'] + ' ' + df['description'])

    # Sauvegarder le modèle sur le disque
    model_data = {'tfidf_vectorizer': tfidf_vectorizer, 'tfidf_matrix': tfidf_matrix}
    joblib.dump(model_data, model_file_path)

    return tfidf_vectorizer, tfidf_matrix

def search_products(query, df, model_file_path):
    # Charger le modèle à partir du fichier
    print("=============Charger le modèle à partir du fichier===============")
    model_data = joblib.load(model_file_path)
    tfidf_vectorizer = model_data['tfidf_vectorizer']
    tfidf_matrix = model_data['tfidf_matrix']

    # Transformer la requête en vecteur TF-IDF
    query_vector = tfidf_vectorizer.transform([query])

    # Calculer les similarités entre la requête et les produits
    similarity_scores = linear_kernel(query_vector, tfidf_matrix).flatten()

    # Tri des produits par similarité décroissante
    product_indices = similarity_scores.argsort()[::-1]

    # Récupérer les produits triés
    sorted_results = df.iloc[product_indices]

    # Filtrer uniquement les produits dont la similarité est supérieure à un certain seuil (par exemple, 0)
    threshold = 0
    relevant_results = sorted_results[similarity_scores[product_indices] > threshold]

    return relevant_results

# Charger les données depuis la base de données
engine = create_engine(f'mysql+mysqlconnector://{dbinfo["user"]}:{dbinfo["password"]}@{dbinfo["host"]}:{port}/{dbinfo["database"]}')
query = "SELECT title, description FROM product"
df = pd.read_sql(query, engine)

# Emplacement du fichier pour sauvegarder/charger le modèle
model_path = "/home/djimba/python_projects/Product_search_and_database_enhancement_project/model"
model_file_path = model_path + "/tfidf_model.pkl"
# Créez le répertoire s'il n'existe pas déjà
os.makedirs(model_path, exist_ok=True)

if os.path.exists(model_file_path):
    # Charger le modèle à partir du fichier
    print("Charger le modèle à partir du fichier")
    tfidf_results = search_products("pain", df, model_file_path)
    print(tfidf_results)
else:
    # Entraîner le modèle TF-IDF une seule fois
    print("Entraîner le modèle TF-IDF une seule fois")
    tfidf_vectorizer, tfidf_matrix = train_tfidf_model(df, model_file_path)
    # Utiliser la fonction de recherche
    tfidf_results = search_products("pain", df, model_file_path)
    print(tfidf_results)

# Fermez la connexion lorsque vous avez terminé
engine.dispose()
