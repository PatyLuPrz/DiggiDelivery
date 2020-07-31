import web
import config

db = config.db


def getPlatillos():
    try:
        platillos_ref = db.collection(u'platillos')
        docs = platillos_ref.limit(9).stream()
        return docs
    except Exception as e:
        print ("Model get productos Error {}".format(e.args))
        return None
    
def getProductos():
    try:
        productos_ref = db.collection(u'productos')
        docs = productos_ref.stream()
        return docs
    except Exception as e:
        return "Error getProductos " + str(e.args)
