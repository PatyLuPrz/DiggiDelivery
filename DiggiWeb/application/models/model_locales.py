import web
import config 
import firebase_admin
from firebase_admin import firestore

db = config.db


def viewLocales(udi):
    try:
        ref_locales = db.collection(u'locales')
        docs = ref_locales.stream()
        for x in docs:
            if x.id == udi:
                diccionario = {"nombre":x.get('nombre'),
                "direccion":x.get('direccion'),
                "telefono":x.get('telefono')}
                break
        return diccionario
    except Exception as e:
        return "Error view Restaurant: " + str(e.args)

def getProductos(uid):
    try:
        ref_productos = db.collection(u'productos')
        docs = ref_productos.stream()
        lista = []
        diccionario = {}
        for x in docs:
            ref = x.get("locales").path.split("/",1)
            if ref[1] == uid:
                diccionario = {"nombre":x.get("nombre"),
                "descripcion":x.get("descripcion"),
                "marca":x.get("marca")}
                lista.append(diccionario)
        return lista
    except Exception as e:
        return "Error get productos model productos: " + str(e.args)


def getProductoByID(uid):
    try:
        doc_ref = db.collection(u'productos').document(uid)
        docs = doc_ref.get().to_dict()
        return docs
    except Exception as e:
        return "Error get Producto by id model productos: " + str(e.args)

def insertProducto(nombre,marca,foto,descripcion,uid):
    try:
        doc_ref = db.collection(u'productos').document() 
        doc_ref.set({
            u'nombre': nombre,
            u'foto': foto,
            u'marca': marca,
            u'descripcion': descripcion,
            u'local':db.collection(u'locales').document(uid),
        })
        return True
    except Exception as e:
        return False
        return "Error insert producto model local" + str(e.args)


def update(nombre,marca,imagen,descripcion,uid):
    try:
        doc_ref = db.collection(u'productos').document(uid) 
        doc_ref.update({
            u'nombre': nombre,
            u'foto': imagen,
            u'marca': marca,
            u'descripcion': descripcion,
        }) 
        return True
    except Exception as e:
        return False
        return "Error update producto model local" + str(e.args)

def delete(uid):
    try:
        db.collection(u'productos').document(uid).delete()
        return True
    except Exception as e:
        return "Error delete producto model local" + str(e.args)
        return False

def getAllProductos(udi):
    try:
        productos_ref = db.collection(u'productos')
        docs = productos_ref.stream()
        productos = []
        for x in docs:
            referencia = str(x.get("local").path)
            new = referencia.split("/",1)
            if (udi == str(new[1])):
                diccionario = {
                    "id" : x.id,
                    "nombre" : x.get("nombre"),
                    "foto" : x.get("foto"),
                    "marca" : x.get("marca"),
                    "local" : x.get("local")}
                productos.append(diccionario)
        return productos
    except Exception as e:
        return "Error getProductos: " +str(e.args)

def getLocalesProductos():
    try:
        productos_ref = db.collection(u'productos')
        docs = productos_ref.limit(9).stream()

        nombres = []
        for x in docs:
            referencia = str(x.get("local").path)
            new = referencia.split("/",1)
            new_ref = db.collection(str(new[0]))
            query = new_ref.stream()
            for i in query:
                if i.id == new[1]:
                    nombres.append(i.get("nombre"))

        return nombres
    except Exception as e:
        return "Error getlocalProductos " +str(e.args)



class UID:
    def __init__(self, UID):
        self.__UID = UID

    def get_UID(self):
        return self.__UID

    def set_UID(self, UID):
        self.__UID = UID