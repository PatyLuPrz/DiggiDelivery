import web
import config
import pyrebase


config = {
  "apiKey":"AIzaSyCRgTvKgLZVLLoeiL6J7lI4O5lwAwXqEVo",
  "authDomain":"diggi-49418.firebaseapp.com",
  "databaseURL":"https://diggi-49418.firebaseio.com",
  "storageBucket":"diggi-49418.appspot.com",
  "serviceAccount":"CuentaServicio.json"
}


def verificarUsuarios(correo, contrasena):
    try:
        firebase = pyrebase.initialize_app(config)
        auth = firebase.auth()
        login = auth.sign_in_with_email_and_password(correo, contrasena)
        print("Succesful")
        return True
    except Exception as e:
        print("Error login: " + str(e.args))
        return False
















# # def autenticar():
# #     try:
# #         archivo = buscar()
# #         print(">>> Archivo elegido:", archivo)
# #         credencial = credentials.Certificate(f'autenticar/{CuentaServicio.json}')
# #         return(firebase_admin.initialize_app(credencial,{
# #             'databaseURL': 'LA URL DE TU BASE DE DATOS'
# #             }
# #         ))
# #     except IndexError:
# #         print("\n>>> Error: ingrese un archivo correcto...")   
# #     except ValueError:
# #         print("\n>>> Error: ya cargó el archivo .json")

# # def buscar():
# #     try:
# #         lista_de_archivos = [obj.name for obj in Path('autenticar/').iterdir() if obj.is_file()]
# #         print("") #salto de línea
# #         for i,j in enumerate(lista_de_archivos):
# #             print(f"[{i}] {j}")
# #         opcion = int(input("\n>>> Ingresa el número del archivo (.json): "))
# #         return lista_de_archivos[opcion]
# #     except FileNotFoundError:
# #         print("\n>>> Error: no se encuentra la carpeta 'autenticar' dentro del mismo directorio...") 
