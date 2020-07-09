import web
import config 
import firebase_admin
from firebase_admin import firestore

db = config.db


def viewRestaurantes(udi):
    try:
        ref_restaurantes = db.collection(u'restaurantes')
        docs = ref_restaurantes.stream()
        for x in docs:
            if x.id == udi:
                diccionario = {"nombre":x.get('nombre'),"direccion":x.get('direccion'),"telefono":x.get('telefono')}
                break
        return diccionario
    except Exception as e:
        return "Error view Restaurant: " + str(e.args)

def getPlatillos(uid):
    try:
        ref_platillos = db.collection(u'platillos')
        docs = ref_platillos.stream()
        lista = []
        diccionario = {}
        for x in docs:
            ref = x.get("restaurante").path.split("/",1)
            if ref[1] == uid:
                diccionario = {"nombre":x.get("nombre"),"descripcion":x.get("descripcion"),"tiempo_preparacion":x.get("tiempo_preparacion")}
                lista.append(diccionario)
        return lista
    except Exception as e:
        return "Error get PLatillos model Platillos: " + str(e.args)



