import web
import app
import application.models.model_usuarios as model_usuarios
render = web.template.render('application/views/main/', base="master.html")

class RegistroUsuarios():
    def GET(self):
        try:
            print("get registro usuarios")
            return render.registroUsuarios()
        except Exception as e:
            return "Error UsuarioGet Controller" + str(e.args)
    def POST(self):
        try:
            print("post registro usuarios")
            form = web.input()
            nivel = form["nivel"]
            if(model_usuarios.insertUsuario(nivel)):
                return "todo bien crack"
            else:
                return "algo fallo crack"
        except Exception as e:
            return "Error UsuarioPOST Controller" + str(e.args)




