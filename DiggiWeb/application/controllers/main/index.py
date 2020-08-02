import web
import app
import application.models.model_main as model_main
render = web.template.render('application/views/main/', base="master.html")


class Index():
    def GET(self):
        try:
            restaurantes  = model_main.getRestaurantes()
            locales = model_main.getLocales()

            platillos = []
            diccionario = {}
            result = model_main.getPlatillos()
            nombres = model_main.getRestaurantesPlatillos()
            id_restaurante = model_main.getRestaurantesPlatillosID()
            cont = 0
            for x in result:
                diccionario = {"uid":x.id,"descripcion":x.get("descripcion"),"nombre":x.get("nombre"),"tiempo_preparacion":x.get("tiempo_preparacion"),"restaurante":nombres[cont],"id_restaurante":id_restaurante[cont],"ingredientes_extra":x.get('ingredientes_extra'),"precio":x.get("precio")}
                platillos.append(diccionario)
                cont += 1

            return render.index(restaurantes,locales,platillos)
        except Exception as e:
            return "Error Index Controller" + str(e.args) 

    def POST(self):
        try:
            form = web.input()
            busqueda = form['busqueda']
            result = model_main.busqueda(busqueda)
            print(result)
            return render.resultadoBusqueda(result)
        except Exception as e:
            return "Error Index Controller POST: " + str(e.args)

