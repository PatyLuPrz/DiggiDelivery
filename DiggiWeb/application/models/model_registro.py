import web
import config
import firebase_admin
from firebase_admin import auth

def registrarUsuarios(correo,contrasena,nombre):
    try:
        user = auth.create_user(
        email=correo,
        email_verified=False,
        password=contrasena,
        display_name=nombre,
        disabled=False)
        print( 'Sucessfully created new user: {0}'.format(user.uid))
    except Exception as e:
        return "Error Model registrarUsuario: " + str(e.args)