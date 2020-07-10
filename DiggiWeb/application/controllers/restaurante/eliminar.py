import web
import app
import application.models.model_restaurante as model_restaurante
render = web.template.render('application/views/restaurante/', base="master.html")

class Eliminar():
    def POST(self,uid):
        try:
            model_restaurante.delete(uid)
            return "Se ha eliminado el registro"
        except Exception as e:
            return "Error eliminar restaurante POST Controller" + str(e.args)

    def GET(self,uid):
        try:
            platillo = model_restaurante.getPlatilloByID(uid)
            return render.eliminar(platillo)
        except Exception as e:
            return "Error eliminar restaurante GET controller: " +str(e.args)