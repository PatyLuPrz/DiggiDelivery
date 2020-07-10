import web
import config
import firebase_admin
import application.models.model_registro as model_registro

db = config.db

def insertUsuario(nivel):
    try:
        UID = model_registro.generarUID.get_UID()
        print(UID)
        print(nivel)
        usuarios_ref = db.collection(u'usuarios').document() 
        usuarios_ref.set({
            u'UID': UID,
            u'nivel': nivel,
        })
        return True
    except Exception as e:
        return "Error Model insertUsuarios: "+str(e.args)
        return False
