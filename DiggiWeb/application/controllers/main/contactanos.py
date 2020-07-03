import web
import app
import application.models.model_contactanos as model_contactanos
render = web.template.render('application/views/main/', base="master.html")

class Contactanos():
    def POST(self):
        try:
            form = web.input()
            correo = form["correo"]
            mensaje = form["mensaje"]
            model_contactanos.enviarCorreo(mensaje,correo)
            return render.mensajeEnviado()
        except Exception as e:
            return "Error contactanos POST Controller" + str(e.args)

    def GET(self):
        try:
            return render.contactanos()
        except Exception as e:
            return "Error contactanos GET controller: " +str(e.args)