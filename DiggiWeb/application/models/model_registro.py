import web
import config
import firebase_admin
from firebase_admin import auth

def registrarUsuarios(correo,contrasena,nombre):
    try:
        if(auth.get_user_by_email(correo)):
            return False
        else:
            user = auth.create_user(
            email=correo,
            email_verified=False,
            password=contrasena,
            display_name=nombre,
            disabled=False)
            return True
    except Exception as e:
        return "Error Model registrarUsuario: " + str(e.args)