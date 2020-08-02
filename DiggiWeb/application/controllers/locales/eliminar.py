import web
import app
import application.models.model_locales as model_locales
render = web.template.render('application/views/locales/', base="master.html")

class Eliminar():
    def POST(self,uid):
        try:
            model_locales.delete(uid)
            return "Se ha eliminado el registro"
        except Exception as e:
            return "Error eliminar locales POST Controller" + str(e.args)

    def GET(self,uid):
        try:
            producto = model_locales.getProductoByID(uid)
            return render.eliminar(producto)
        except Exception as e:
            return "Error eliminar locales GET controller: " +str(e.args)