import web
import app
import application.models.model_locales as model_locales
render = web.template.render('application/views/locales/', base="master.html")

class Insertar():
    def POST(self,uid):
        try:
            form = web.input()
            insert = model_locales.insertPlatillo(form['Nombre'],form['Descripcion'],form['Imagen'],
            form['Ingredientes_extra'].split(","),form['Tiempo_preparacion'],uid)
            if(insert):
                return "Registro insertado"
            else:
                return "Algo salio mal"
        except Exception as e:
            return "Error insertar locales POST Controller" + str(e.args)

    def GET(self,uid):
        try:
            return render.insertar()
        except Exception as e:
            return "Error insertar locales GET controller: " +str(e.args)