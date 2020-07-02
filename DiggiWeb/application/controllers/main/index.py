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

            platillos = []
            diccionario = {}
            result = model_main.getPlatillos()
            for x in result:
                diccionario = {"descripcion":x.get("descripcion"),"nombre":x.get("nombre"),"restaurante":x.get("restaurante"),"tiempo_preparacion":x.get("tiempo_preparacion"),"restaurante":x.get("restaurante")}
                platillos.append(diccionario)
            
            
            return render.index(restaurantes,locales,platillos)
        except Exception as e:
            return "Error Index Controller" + str(e.args)