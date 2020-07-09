import web

urls = (
    '/', 'application.controllers.main.index.Index',
    '/nosotros','application.controllers.main.nosotros.Nosotros',
    '/registro','application.controllers.main.registro.Registro',
    '/usuarios','application.controllers.main.registroUsuarios.RegistroUsuarios',
    '/contacto','application.controllers.main.contactanos.Contactanos',
    '/restaurante/(.*)','application.controllers.main.restaurante.Restaurante',
    '/platillo/(.*)','application.controllers.main.view.View',
    '/local/(.*)','application.controllers.main.view.View',
)

app = web.application(urls, globals())


if __name__ == "__main__":
    app.run()