import web
import config
import firebase_admin

db = config.db

def insertarRestaurante(nombre,telefono,direccion):
    try:
        doc_ref = db.collection(u'restaurantes').document() 
        doc_ref.set({
            u'direccion': direccion,
            u'foto': u'default.jpg',
            u'nombre': nombre,
            u'telefono': telefono
        }) 
        return True
    except Exception as e:
        return False
        return "error model insertar restaurante" + str(e.args)

def insertarNegocio(nombre,telefono,direccion):
    try:
        doc_ref = db.collection(u'locales').document() 
        doc_ref.set({
            u'direccion': direccion,
            u'foto': u'default.jpg',
            u'nombre': nombre,
            u'telefono': telefono
        }) 
        return True
    except Exception as e:
        return False
        return "error model insertar local" + str(e.args)
    

def insertarCliente(nombre,telefono,direccion):
    try:
        doc_ref = db.collection(u'clientes').document() 
        doc_ref.set({
            u'direccion': direccion,
            u'foto': u'default.jpg',
            u'nombre': nombre,
            u'telefono': telefono
        }) 
        return True
    except Exception as e:
        return False
        return "error model insertar cliente" + str(e.args)
