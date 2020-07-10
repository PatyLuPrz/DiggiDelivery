import web
import app
import application.models.model_locales as model_locales
render = web.template.render('application/views/locales/', base="master.html")

class Insertar():
    def POST(self,uid):
        try:
            form = web.input()
            descripcion = {'cantidad_disponible':form['Cant_disponible'] , 'precio':form['Precio'] ,'presentacion': form['Presentacion']}
            imagen = form['Imagen']
            marca = form['Marca']
            nombre = form['Nombre']

            insert = model_locales.insertProducto(nombre,marca,imagen,descripcion,uid)
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