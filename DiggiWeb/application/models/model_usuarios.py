import web
import config
from application.models.model_registro import email

db = config.db

def insertUsuario(nivel):
    try:
        global email
        print(email)
        print(nivel)
        usuarios_ref = db.collection(u'usuarios').document() 
        usuarios_ref.set({
            u'email': email,
            u'nivel': nivel,
        })
        return True
    except Exception as e:
        print( "Error Model insertUsuarios: "+str(e.args))
        return False
