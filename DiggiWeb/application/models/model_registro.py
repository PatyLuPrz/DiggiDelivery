import web
import pyrebase
from getpass import getpass


config = {
  "apiKey":"MIIEuwIBADANBgkqhkiG9w0BAQEFAASCBKUwggShAgEAAoIBAQDWfwmw/PQyirdF\nhsfAky2XnXgeybACKvMwwJlrdh2uIKWVOHk6eb93cx3ULAmBSIGCOxfBdHjZkeco\nQTPmDpPbVQaL2s+FvyDRco6zBILJHOdYRMxYaE0HsNQi7ScAaIuywF2MZusK/upl\n/DGAJTxT6/ehnGIrBrcUVC85lmjzoneAYncK/7paPCmLrD9wTBufZ81Xf6SAFwKr\nh0k0i2tNZOb760YxYHxPeLe1CfsO5fspsRgm4iwLpmgkHFlzGn2VMdC7muLprq3G\ngRHIoDnupqD4ZeruQhuUKpIU3CT7MSwE50cmvMUPailezgDgqljNeNDIwouaW/Vs\nEaQWZNgpAgMBAAECgf9ZJxLBqEl19WLWD02uJNOjvR75Y9sftjRGCRzHrBmRoduS\neXLFQu2tdUn2u3uZa2sTl6C75kWqEG6DzMbXxgaWQd9YNayRzDqUuz+UoqbFv9Yf\nNYVwpz7K1RAB7jrgGz64XIVg6FnhuB60+9qLDVCF2kslJBGpezNULXiwcM3NB5vL\nAJXh2cUbeALjoTkHpj25rO0FyfCvMEEXjFLCB9mNL+fRjeCfOxZb+TyIdpDo0Lu/\naQuz4LjUIQ5inFXU59UFwWWz7b8ZcltF7sc7DV6iYIMh6XgpMp5VfnjUMWbi58m8\nIYJ8eEZ33vigA+8bHflc4z63G5GSmvO476IXkKkCgYEA9QT5H2sYgSeO2ywxEglO\ndKrRbjmjrc7DbvV+qVopmTlR6Anlhmswq/gQaH3BtIMNLVSEv6kLs50PgthOe+ep\npFdl1MGqF0PLd4xQZ4VtqL18RadyJN+iDys6ltdJ++JyvHMw5UzakPQcwIP4Srah\nOJwG0l9LKCQ/hTlJl/+XS4UCgYEA4Bvh329sU++Yr2jD8cl7e29f7qaYDsJRCEus\n42YMCYDERu/invwsgNgmFqlBKcC37GKL/ZjjQQ7ExT17l2WDL67zPqPcd5pPTBid\nCU2+nPHYuAkSZ4knT1r517/zygtYR+C6xwS5PzJhJXEQg6J+l/bGoOghhl8QzrrQ\nA23MQVUCgYBXfOwbbNk2HNLkrbXj09Dg1bGsYwZv5FliQGR2wgwCezYk3YvIYHPj\no9LwDJ9i/jxxSDGSYiEchGNqfCQiGAk59j8VJgW/AuUfDcoT/M+4Jdi+4lhelD/A\nnNXx0HPJbgU8BwGZjsSoZ5Hwp+67dtTAau4Apigm8DKCNn9xt8DlJQKBgQCWh6Pr\n5Heq2WCBUalrmp3qhyC0uAmiwDqVi98QztZ++5La4v4hM9jgok7TIdS3Ks9fY8IM\nEMl0RWs94NJHGtRHDwgrpvzLCUcCIfY47ZN+76NV2iIWkTVqQ/1VQYWKzJv7i6Np\nUm7rV/eQoqUpBdhqUkOQiNsb2nb7pNdbtkBgEQKBgBKhoKeHhiTYv/12cVEuGjZq\nqKSuSt5wEVfRuWCjsV5qNWN1oCTkyLnh86rRUhem7zUI+nhTDH7lrxBtK2inW9dR\nxrxgHOhA6iqG54JtNt2Z7minJWAqn7z6Oj8EPg5HeGwpQV4r7MXJoq2+v6ofcNdB\n1BW2o7C5wwfJVfHRL5Of",
  "authDomain":"diggi-49418.firebaseapp.com",
  "databaseURL":"https://diggi-49418.firebaseio.com",
  "storageBucket":"diggi-49418.appspot.com",
  "serviceAccount":"CuentaServicio.json"
}

firebase = pyrebase.initialize_app(config)

auth = firebase.auth()


email = input("Please Enter Your Email Address : \n")
password = getpass("Please Enter Your Password : \n")
 


def registrarUsuarios(correo,contrasena):
    try:
        user = auth.create_user_with_email_and_password(email, password)
        return True
    except:
        return True


""" import web
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
 """