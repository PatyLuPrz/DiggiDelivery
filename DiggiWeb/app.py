import web

urls = (
    '/', 'application.controllers.main.index.Index',
    '/nosotros','application.controllers.main.nosotros.Nosotros',
    '/registro','application.controllers.main.registro.Registro',
    '/usuarios','application.controllers.main.registroUsuarios.RegistroUsuarios',
    '/contacto','application.controllers.main.contactanos.Contactanos',
)

app = web.application(urls, globals())


if __name__ == "__main__":
    app.run()