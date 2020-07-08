import web
import config
import firebase_admin
from firebase_admin import auth
import uuid


def registrarUsuarios(correo,contrasena,nombre):
    try:
        auth.get_user_by_email(correo)
        return False
    except:
        user = auth.create_user(
            uid=obtenerUID(),
            email=correo,
            email_verified=False,
            password=contrasena,
            display_name=nombre,
            disabled=False)
        return True


def obtenerUID():
    try:
        UID = generarUID(str(uuid.uuid4().fields[-1])[:20])
        return UID.get_UID()
    except Exception as e:
        return "Error al generar UID: " + str(e.args)
        
class generarUID:
    def __init__(self, UID):
        self.__UID = UID

    def get_UID(self):
        return self.__UID

    def set_UID(self, UID):
        self.__UID = UID
