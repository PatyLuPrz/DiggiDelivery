import web
import app
import application.models.model_usuarios as model_usuarios
render = web.template.render('application/views/main/', base="master.html")

class RegistroUsuarios():
    def GET(self,nivel):
        try:
            if(nivel == '0'):
                print('0')
            elif(nivel == '1'):
                print("1")
            elif(nivel == '2'):
                print("2")
            else:
                print("Ese no existe brow")
        except Exception as e:
            return "Error UsuarioGet Controller" + str(e.args)
    def POST(self,nivel):
        try:
            print(nivel)
            print(type(nivel))
        except Exception as e:
            return "Error UsuarioPOST Controller" + str(e.args)




