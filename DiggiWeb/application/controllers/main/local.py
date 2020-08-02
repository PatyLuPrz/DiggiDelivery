import web
import app
import application.models.model_locales as model_locales
render = web.template.render('application/views/main/', base="master.html")


class Local():
    def GET(self,uid):
        try:
            local = model_locales.viewLocales(uid)
            productos = model_locales.getProductos(uid)
            return render.local_view(local,productos)
        except Exception as e:
            return "Error controller Local GET: " + str(e.args)