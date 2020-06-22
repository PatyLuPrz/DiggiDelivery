import firebase_admin # Importamos la libreria de firebase
from firebase_admin import credentials # Importamos la funcion que valida las credenciales 
from firebase_admin import firestore # Y la funcion de firestore


cred = credentials.Certificate('CuentaServicio.json') # Aqui lee las redenciales de la base de datos
firebase_admin.initialize_app(cred) # Aqui valida las credenciales

db = firestore.client() # Aqui conecta con la base de datos generando un servidor local

doc_ref = db.collection(u'users').document(u'alovelace') # Esto es como con mongo, genera una nueva coleccion y agrega un documento
doc_ref.set({
    u'first': u'Ada',
    u'last': u'Lovelace',
    u'born': 1815
}) # Y aqui agrega datos al docuemtno

users_ref = db.collection(u'users') #Aqui obtiene todo lo que existe en la coleccion de users
docs = users_ref.stream() # Esta linea la neta no se pa que sirve pero pasa el result una nueva variable

for doc in docs: # Aqui abrimos un ciclo para imprimir todos los documentos de la coleccion
    print(u'{} => {}'.format(doc.id, doc.to_dict())) # Y aqui les da un formato bonito para imprimir