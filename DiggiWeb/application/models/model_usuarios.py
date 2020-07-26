import web
import config
from application.models.model_registro import token,email

db = config.db

def insertUsuario(nivel):
    try:
        print("###########")
        print(email,"\n",token)
        UID = token
        usuarios_ref = db.collection(u'usuarios').document() 
        usuarios_ref.set({
            u'UID': UID,
            u'nivel': nivel,
        })
        return True
    except Exception as e:
        print( "Error Model insertUsuarios: "+str(e.args))
        return False
