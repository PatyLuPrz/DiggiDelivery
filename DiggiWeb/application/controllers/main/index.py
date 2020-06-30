from . import config
import app


class Index:
    def GET():
        try:
            return config.render.index()
        except Exception as e:
            return "Error: " + str(e.args)