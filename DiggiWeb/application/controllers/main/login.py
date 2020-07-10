import web
import app
import application.models.model_login as model_login
render = web.template.render('application/views/main/', base="master.html")

# TODO: Generar login

class Login():
    def GET(self):
        try:
            return render.login()
        except Exception as e:
            return "Error RegistroGet Controller" + str(e.args)
    def POST(self):
        try:
            return render.login()
        except Exception as e:
            return "Error RegistroPost Controller" + str(e.args)

