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
    '/usuarios/restaurante','application.controllers.restaurante.index.Index',
    '/usuarios/restaurante/platillos/(.*)','application.controllers.restaurante.platillos.Platillos',
    '/usuarios/restaurante/insertar/(.*)','application.controllers.restaurante.insertar.Insertar',
    '/usuarios/restaurante/editar/(.*)','application.controllers.restaurante.editar.Editar',
    '/usuarios/restaurante/eliminar/(.*)','application.controllers.restaurante.eliminar.Eliminar',
)

app = web.application(urls, globals())


if __name__ == "__main__":
    app.run()