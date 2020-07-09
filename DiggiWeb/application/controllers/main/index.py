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
            nombres = model_main.getRestaurantesPlatillos()
            id_restaurante = model_main.getRestaurantesPlatillosID()
            cont = 0
            for x in result:
                diccionario = {"descripcion":x.get("descripcion"),"nombre":x.get("nombre"),"tiempo_preparacion":x.get("tiempo_preparacion"),"restaurante":nombres[cont],"id_restaurante":id_restaurante[cont]}
                platillos.append(diccionario)
                cont += 1

            return render.index(restaurantes,locales,platillos)
        except Exception as e:
            return "Error Index Controller" + str(e.args) + "\n Message: " + str(e.message)

    def POST(self):
        try:
            form = web.input()
            busqueda = form['busqueda']
            result = model_main.busqueda(busqueda)
            print(result)
            return render.resultadoBusqueda(result)
        except Exception as e:
            return "Error Index Controller POST: " + str(e.args) + "\n Message: " + str(e.message)

