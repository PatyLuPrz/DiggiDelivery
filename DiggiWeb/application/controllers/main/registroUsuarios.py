import web
import app
import application.models.model_usuarios as model_usuarios
render = web.template.render('application/views/main/', base="master.html")

# FIXME: Este es el que no sirve
# FIXME: El GET Funciona bien, el POST solo hace el render xd los insert nel

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
                if (str(nivel) == '0'):
                    model_usuarios.insertUsuario("0") # FIXME: Lo puse inclushive asi para ver si jalaba y nel
                    raise web.seeother("/registrar/restaurante")
                elif (str(nivel) == '1'):
                    model_usuarios.insertUsuario("1")
                    raise web.seeother("/registrar/negocio")
                elif (str(nivel) == '2'):
                    model_usuarios.insertUsuario("2")
                    raise web.seeother("/registrar/cliente")
            else:
                return "algo fallo"
        except Exception as e:
            return "Error UsuarioPOST Controller" + str(e.args)




