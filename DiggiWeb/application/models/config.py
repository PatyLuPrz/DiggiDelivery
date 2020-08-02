import firebase_admin # Importamos la libreria de firebase
from firebase_admin import credentials # Importamos la funcion que valida las credenciales 
from firebase_admin import firestore # Y la funcion de firestore

archivo_json = "CuentaServicio.json"
cred = credentials.Certificate(archivo_json) # Aqui lee las redenciales de la base de datos
firebase_admin.initialize_app(cred) # Aqui valida las credenciales

db = firestore.client() # Aqui conecta con la base de datos generando un servidor local