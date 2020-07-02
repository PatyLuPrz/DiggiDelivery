import web
import app
import application.models.model_main as model_main
render = web.template.render('application/views/main/', base="master.html")


class Index():
    def GET(self):
        try:
            restaurantes = []
            diccionario = {}
            result  = model_main.getRestaurantes()
            for x in result:
                diccionario = {"nombre":x.get("nombre"),"direccion":x.get("direccion")}
                restaurantes.append(diccionario)
            
            locales = []
            diccionario = {}
            result = model_main.getLocales()
            for x in result:
                diccionario = {"nombre":x.get("nombre"),"direccion":x.get("direccion")}
                locales.append(diccionario)

            return render.index(restaurantes,locales)
        except Exception as e:
            return "Error: " + str(e.args)