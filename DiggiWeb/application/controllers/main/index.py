import web
import app
render = web.template.render('application/views/main/', base="master.html")


class Index():
    def GET(self):
        try:
            return render.index()
        except Exception as e:
            return "Error: " + str(e.args)