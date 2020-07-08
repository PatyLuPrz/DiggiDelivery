import web
import app
import application.models.model_registro as model_registro
render = web.template.render('application/views/main/', base="master.html")

class Registro():
    def GET(self):
        try:
            return render.registro()
        except Exception as e:
            return "Error RegistroGet Controller" + str(e.args)
    def POST(self):
        try:
            form = web.input()
            correo = form["email"]
            nombre = form["nombre"] + " " +form["apellido"]
            contrasena = form["contrasena"]
            result = model_registro.registrarUsuarios(correo,contrasena,nombre)
            print(result)
            if(result):
                raise  web.seeother("/usuarios")
            else:
                return render.registroErroneo()
        except Exception as e:
            return "Error RegistroPost Controller" + str(e.args)




