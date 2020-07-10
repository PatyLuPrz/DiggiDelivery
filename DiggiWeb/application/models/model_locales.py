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


def getPlatilloByID(uid):
    try:
        doc_ref = db.collection(u'platillos').document(uid)
        docs = doc_ref.get().to_dict()
        return docs
    except Exception as e:
        return "Error get PLatillo by id model Platillos: " + str(e.args)

def insertPlatillo(nombre,descripcion,foto,ingredientes_extra,tiempo_preparacion,uid):
    try:
        doc_ref = db.collection(u'platillos').document() 
        doc_ref.set({
            u'nombre': nombre,
            u'descripcion': descripcion,
            u'foto': foto,
            u'ingredientes_extra': ingredientes_extra,
            u'restaurante':db.collection(u'restaurantes').document(uid),
            u'tiempo_preparacion':str(tiempo_preparacion)+" min",
        })
        return True
    except Exception as e:
        return False
        return "Error insert platillo model restaurante"

def update(uid,nombre,descripcion,foto,ingredientes_extra,tiempo_preparacion):
    try:
        doc_ref = db.collection(u'platillos').document(uid) 
        doc_ref.update({
            u'nombre': nombre,
            u'descripcion': descripcion,
            u'foto': foto,
            u'ingredientes_extra': ingredientes_extra,
            u'tiempo_preparacion':str(tiempo_preparacion)+" min",
        }) 
        return True
    except Exception as e:
        return False
        return "Error update platillo model restaurante"

def delete(uid):
    try:
        db.collection(u'platillos').document(uid).delete()
        return True
    except Exception as e:
        return False
        return "Error delete platillo model restaurante"

def getAllPlatillos(udi):
    try:
        platillos_ref = db.collection(u'platillos')
        docs = platillos_ref.stream()
        platillos = []
        for x in docs:
            referencia = str(x.get("restaurante").path)
            new = referencia.split("/",1)
            if (udi == str(new[1])):
                diccionario = {
                    "id":x.id,
                    "nombre" : x.get("nombre"),
                    "foto" : x.get("foto"),
                    "descripcion" : x.get("descripcion"),
                    "ingredientes_extra" : x.get("ingredientes_extra"),
                    "tiempo_preparacion" : x.get("tiempo_preparacion"),
                    "restaurante" : x.get("restaurante")}
                platillos.append(diccionario)
        return platillos
    except Exception as e:
        return "Error getPlatillos: " +str(e.args)

def getRestaurantesPlatillos():
    try:
        platillos_ref = db.collection(u'platillos')
        docs = platillos_ref.limit(9).stream()

        nombres = []
        for x in docs:
            referencia = str(x.get("restaurante").path)
            new = referencia.split("/",1)
            new_ref = db.collection(str(new[0]))
            query = new_ref.stream()
            for i in query:
                if i.id == new[1]:
                    nombres.append(i.get("nombre"))

        return nombres
    except Exception as e:
        return "Error getRestaurantePlatillos " +str(e.args)



class UID:
    def __init__(self, UID):
        self.__UID = UID

    def get_UID(self):
        return self.__UID

    def set_UID(self, UID):
        self.__UID = UID