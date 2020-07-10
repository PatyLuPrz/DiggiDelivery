import web
import app
import application.models.model_registroUsuarios as model_registro
import application.models.model_registro as model
render = web.template.render('application/views/main/', base="master.html")

class Clientes():
    def GET(self):
        try:
            return render.registrarClientes()
        except Exception as e:
            return "Error RegistroGet Controller" + str(e.args)
    def POST(self):
        try:
            form = web.input()
            direccion = form['Direccion']
            nombre = form['Nombre']
            telefono = form['Telefono']
            result = model_registro.insertarCliente(nombre,telefono,direccion)
            print(result)
            if(result):
                return render.registroExitoso()
            else:
                return render.registroErroneo()
        except Exception as e:
            return "Error RegistroPost Controller" + str(e.args)

class Negocios():
    def GET(self):
        try:
            return render.registrarNegocio()
        except Exception as e:
            return "Error RegistroGet Controller" + str(e.args)
    def POST(self):
        try:
            form = web.input()
            direccion = form['Direccion']
            nombre = form['Nombre']
            telefono = form['Telefono']
            result = model_registro.insertarNegocio(nombre,telefono,direccion)
            print(result)
            if(result):
                return render.registroExitoso()
            else:
                return render.registroErroneo()
        except Exception as e:
            return "Error RegistroPost Controller" + str(e.args)

class Restaurantes():
    def GET(self):
        try:
            return render.registrarRestaurante()
        except Exception as e:
            return "Error RegistroGet Controller" + str(e.args)
    def POST(self):
        try:
            form = web.input()
            direccion = form['Direccion']
            nombre = form['Nombre']
            telefono = form['Telefono']
            result = model_registro.insertarRestaurante(nombre,telefono,direccion)
            print(result)
            if(result):
                return render.registroExitoso()
            else:
                return render.registroErroneo()
        except Exception as e:
            return "Error RegistroPost Controller" + str(e.args)