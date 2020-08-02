import web
<<<<<<< HEAD
import app
import application.models.model_login as model_login
render = web.template.render('application/views/main/', base="master.html")

=======
import config
import app
from application.models.model_login import verificarUsuarios
#from firebase_admin import auth
render = web.template.render('application/views/main/', base="master.html")

db = config.db
>>>>>>> 39708b1cbcf15a7a2de2ee72e208be4d0d2f6d8e
# TODO: Generar login

class Login():
    def GET(self):
        try:
            return render.login()
        except Exception as e:
            return "Error RegistroGet Controller" + str(e.args)
    def POST(self):
        try:
<<<<<<< HEAD
            # return render.login()
            form = web.input()
            correo = form["email"]
            contrasena = form["contrasena"]
            model_login.verificarUsuarios(correo ,contrasena)

=======
            form = web.input()
            result = verificarUsuarios(form['email'],form['contrasena'])
            if result:
                ref_niveles = db.collection(u'usuarios')
                docs = ref_niveles.stream()
                for item in docs:
                    print("for")
                    if str(item.get("email")) == str(form['email']):
                        print("if")
                        nivel = item.get("nivel")
                        #user = auth.get_user_by_email(str(form['email']))
                        #uid = user.uid
                        if nivel == '0':
                            print("restaurante")
                            return render.loginSucess("Restaurante",str(form['email']))
                        elif nivel == '1':
                            print("negocio")
                            return render.loginSucess("Negocio",str(form['email']))
                        elif nivel == '2':
                            print("cliente")
                            return render.loginSucess("Cliente",str(form['email']))
                    else:
                        print("no jalo xd")
            else:
                return "algo salio mal :("
>>>>>>> 39708b1cbcf15a7a2de2ee72e208be4d0d2f6d8e
        except Exception as e:
            return "Error RegistroPost Controller" + str(e.args)



# import web
# import app
# import application.models.model_login as model_login
# render = web.template.render('application/views/main/', base="master.html")

# TODO: Generar login

# class Login():
#     def GET(self):
#         try:
#             return render.login()
#         except Exception as e:
#             return "Error RegistroGet Controller" + str(e.args)
#     def POST(self):
#         try:
#             return render.login()
            # form = web.input()
            # correo = form["email"]
            # password = form["password"]
            # result = model_login.verificarUsuarios(correo, password)
            # print(result)
            # if(result):
            #     raise  web.seeother("/index")
            # else:
            #     return render.registroErroneo()
        # except Exception as e:
        #     return "Error RegistroPost Controller" + str(e.args)

