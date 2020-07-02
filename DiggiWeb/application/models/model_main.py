import web
import config 
import firebase_admin
from firebase_admin import firestore

db = config.db


def getRestaurantes():
    try:
        restaurantes_ref = db.collection(u'restaurantes')
        docs = restaurantes_ref.stream()
        return docs
    except Exception as e:
        return "Error getRestaurantes: " + str(e.args)

def getLocales():
    try:
        locales_ref = db.collection(u'locales')
        docs = locales_ref.stream()
        return docs
    except Exception as e:
        return "Error getLocales: " + str(e.args)
    
    
