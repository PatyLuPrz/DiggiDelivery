import web
import app
import application.models.model_restaurante as model_restaurante
render = web.template.render('application/views/main/', base="master.html")


class Restaurante():
    def GET(self,uid):
        try:
            restaurante = model_restaurante.viewRestaurantes(uid)
            platillos = model_restaurante.getPlatillos(uid)
            return render.restaurante_view(restaurante,platillos)
        except Exception as e:
            return "Error controller Restaurante GET: " + str(e.args)


