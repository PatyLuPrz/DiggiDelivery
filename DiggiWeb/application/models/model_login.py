import web
import config
<<<<<<< HEAD
import firebase_admin
# from firebase import firebases
# from firebase_admin import auth

# firebaseConfig = {
#     "type": "service_account",
#     "project_id": "diggi-49418",
#     "private_key_id": "460da3d90d9bb706c237e626768641c989d90159",
#     "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEuwIBADANBgkqhkiG9w0BAQEFAASCBKUwggShAgEAAoIBAQDWfwmw/PQyirdF\nhsfAky2XnXgeybACKvMwwJlrdh2uIKWVOHk6eb93cx3ULAmBSIGCOxfBdHjZkeco\nQTPmDpPbVQaL2s+FvyDRco6zBILJHOdYRMxYaE0HsNQi7ScAaIuywF2MZusK/upl\n/DGAJTxT6/ehnGIrBrcUVC85lmjzoneAYncK/7paPCmLrD9wTBufZ81Xf6SAFwKr\nh0k0i2tNZOb760YxYHxPeLe1CfsO5fspsRgm4iwLpmgkHFlzGn2VMdC7muLprq3G\ngRHIoDnupqD4ZeruQhuUKpIU3CT7MSwE50cmvMUPailezgDgqljNeNDIwouaW/Vs\nEaQWZNgpAgMBAAECgf9ZJxLBqEl19WLWD02uJNOjvR75Y9sftjRGCRzHrBmRoduS\neXLFQu2tdUn2u3uZa2sTl6C75kWqEG6DzMbXxgaWQd9YNayRzDqUuz+UoqbFv9Yf\nNYVwpz7K1RAB7jrgGz64XIVg6FnhuB60+9qLDVCF2kslJBGpezNULXiwcM3NB5vL\nAJXh2cUbeALjoTkHpj25rO0FyfCvMEEXjFLCB9mNL+fRjeCfOxZb+TyIdpDo0Lu/\naQuz4LjUIQ5inFXU59UFwWWz7b8ZcltF7sc7DV6iYIMh6XgpMp5VfnjUMWbi58m8\nIYJ8eEZ33vigA+8bHflc4z63G5GSmvO476IXkKkCgYEA9QT5H2sYgSeO2ywxEglO\ndKrRbjmjrc7DbvV+qVopmTlR6Anlhmswq/gQaH3BtIMNLVSEv6kLs50PgthOe+ep\npFdl1MGqF0PLd4xQZ4VtqL18RadyJN+iDys6ltdJ++JyvHMw5UzakPQcwIP4Srah\nOJwG0l9LKCQ/hTlJl/+XS4UCgYEA4Bvh329sU++Yr2jD8cl7e29f7qaYDsJRCEus\n42YMCYDERu/invwsgNgmFqlBKcC37GKL/ZjjQQ7ExT17l2WDL67zPqPcd5pPTBid\nCU2+nPHYuAkSZ4knT1r517/zygtYR+C6xwS5PzJhJXEQg6J+l/bGoOghhl8QzrrQ\nA23MQVUCgYBXfOwbbNk2HNLkrbXj09Dg1bGsYwZv5FliQGR2wgwCezYk3YvIYHPj\no9LwDJ9i/jxxSDGSYiEchGNqfCQiGAk59j8VJgW/AuUfDcoT/M+4Jdi+4lhelD/A\nnNXx0HPJbgU8BwGZjsSoZ5Hwp+67dtTAau4Apigm8DKCNn9xt8DlJQKBgQCWh6Pr\n5Heq2WCBUalrmp3qhyC0uAmiwDqVi98QztZ++5La4v4hM9jgok7TIdS3Ks9fY8IM\nEMl0RWs94NJHGtRHDwgrpvzLCUcCIfY47ZN+76NV2iIWkTVqQ/1VQYWKzJv7i6Np\nUm7rV/eQoqUpBdhqUkOQiNsb2nb7pNdbtkBgEQKBgBKhoKeHhiTYv/12cVEuGjZq\nqKSuSt5wEVfRuWCjsV5qNWN1oCTkyLnh86rRUhem7zUI+nhTDH7lrxBtK2inW9dR\nxrxgHOhA6iqG54JtNt2Z7minJWAqn7z6Oj8EPg5HeGwpQV4r7MXJoq2+v6ofcNdB\n1BW2o7C5wwfJVfHRL5Of\n-----END PRIVATE KEY-----\n",
#     "client_email": "firebase-adminsdk-8b62k@diggi-49418.iam.gserviceaccount.com",
#     "client_id": "100900003046980775321",
#     "auth_uri": "https://accounts.google.com/o/oauth2/auth",
#     "token_uri": "https://oauth2.googleapis.com/token",
#     "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
#     "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-8b62k%40diggi-49418.iam.gserviceaccount.com"
# }

def verificarUsuarios(correo, contrasena):
    try:
        # firebase = pyrebase.initialize_app(config)
        # auth = firebase.auth()
        # login = auth.sign_in_with_email_and_password(correo, contrasena)
        print(correo, contrasena)
        print("Succesful")
        return True
    except Exception as e:
        return "Error RegistroPost Controller model" + str(e.args)
        return False

=======
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
>>>>>>> 39708b1cbcf15a7a2de2ee72e208be4d0d2f6d8e
















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
