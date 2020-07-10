import web
import app
import application.models.model_locales as model_locales
render = web.template.render('application/views/locales/', base="master.html")

class Productos():
    def POST(self,uid):
        try:
            model_locales.UID.set_UID(uid)
            productos = model_locales.getAllProductos(uid)
            return render.productos(productos)
        except Exception as e:
            return "Error productos locales POST Controller" + str(e.args)

    def GET(self,uid):
        try:
            productos = model_locales.getAllProductos(uid)
            return render.productos(productos,uid)
        except Exception as e:
            return "Error productos locales GET controller: " +str(e.args) 