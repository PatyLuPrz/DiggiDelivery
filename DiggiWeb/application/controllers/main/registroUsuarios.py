import web
import app
import application.models.model_registro as model_registro
render = web.template.render('application/views/main/', base="master.html")

class RegistroUsuarios():
    def GET(self):
        try:
            return render.registroUsuarios()
        except Exception as e:
            return "Error RegistroGet Controller" + str(e.args)
    def POST(self):
        try:
            return render.registroUsuarios()
        except Exception as e:
            return "Error RegistroPost Controller" + str(e.args)




