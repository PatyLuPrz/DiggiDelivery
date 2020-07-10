import web
import app
import application.models.model_locales as model_locales
render = web.template.render('application/views/locales/', base="master.html")

class Editar():
    def POST(self,uid):
        try:
            form = web.input()

            edit = model_locales.update(uid,form['Nombre'],form['Descripcion'],form['Imagen'],form['Ingredientes_extra'],form['Tiempo_preparacion'])
            if(edit):
                return "todo bien"
            else:
                return "algo sucedio y no se logro el update, intentalo de nuevo"
        except Exception as e:
            return "Error editar locales POST Controller" + str(e.args)

    def GET(self,uid):
        try:
            platillo = model_locales.getPlatilloByID(uid)
            return render.editar(platillo)
        except Exception as e:
            return "Error editar locales GET controller: " +str(e.args)