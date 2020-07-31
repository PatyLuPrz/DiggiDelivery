import web
import config
import hashlib
import app
import application.models.model_carrito
render = web.template.render('application/views/carrito/', base='master')
model = application.models.model_carrito

class Index:
    
    def __init__(self):
        pass

    def GET(self):
        platillos = model.getPlatillos()
        productos = model.getProductos()
        return render.index(platillos,productos) 
