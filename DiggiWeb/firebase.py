import firebase_admin # Importamos la libreria de firebase
from firebase_admin import credentials # Importamos la funcion que valida las credenciales 
from firebase_admin import firestore # Y la funcion de firestore


cred = credentials.Certificate('CuentaServicio.json') # Aqui lee las redenciales de la base de datos
firebase_admin.initialize_app(cred) # Aqui valida las credenciales

db = firestore.client() # Aqui conecta con la base de datos generando un servidor local

doc_ref = db.collection(u'platillos').document() # Esto es como con mongo, genera una nueva coleccion y agrega un documento
doc_ref.set({
    u'descripcion': u'Esto es un platillo muy rico hecho con queso artesanal',
    u'foto': u'default.jpg',
    u'ingredientes_extra': ['queso chedar','jitomate','cebolla morada'],
    u'restaurante':
}) # Y aqui agrega datos al docuemtno

restaurantes_ref = db.collection(u'restaurantes') #Aqui obtiene todo lo que existe en la coleccion de users
docs = restaurantes_ref.stream() # Esta linea la neta no se pa que sirve pero pasa el result una nueva variable

for doc in docs: # Aqui abrimos un ciclo para imprimir todos los documentos de la coleccion
    print(u'{} => {}'.format(doc.id, doc.to_dict())) # Y aqui les da un formato bonito para imprimir



doc_ref.set({
    u'descripcion': u'Ideal para compartir con la familia y amigos en una reunión casual',
    u'foto': u'default.jpg',
    u'ingredientes_extra': ['queso extra','peperoni','piña'],
    u'nombre' : 'Pastel de chocolate',
    u'restaurante' : u'restaurante',
    u'tiempo_preparacion' : u'30 min'
})