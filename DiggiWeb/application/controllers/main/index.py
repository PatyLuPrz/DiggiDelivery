import web
import json
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
            return render.index(restaurantes)
        except Exception as e:
            return "Error: " + str(e.args)