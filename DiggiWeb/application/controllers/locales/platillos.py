import web
import app
import application.models.model_restaurante as model_restaurante
render = web.template.render('application/views/restaurante/', base="master.html")

class Platillos():
    def POST(self,uid):
        try:
            model_restaurante.UID.set_UID(uid)
            platillos = model_restaurante.getAllPlatillos(uid)
            return render.platillos(platillos)
        except Exception as e:
            return "Error platillos restaurante POST Controller" + str(e.args)

    def GET(self,uid):
        try:
            platillos = model_restaurante.getAllPlatillos(uid)
            return render.platillos(platillos,uid)
        except Exception as e:
            return "Error platillos restaurante GET controller: " +str(e.args) 