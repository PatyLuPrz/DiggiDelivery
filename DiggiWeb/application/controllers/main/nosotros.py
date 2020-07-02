import web
import app
render = web.template.render('application/views/main/', base="master.html")

class Nosotros():
    def GET(self):
        try:
            return render.nosotros()
        except Exception as e:
            return "Error Nosotros Controller" + str(e.args)