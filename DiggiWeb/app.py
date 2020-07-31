import web
from web import application

urls = (
    '/', 'application.controllers.main.index.Index',
    '/login', 'application.controllers.main.login.Login',
    '/nosotros','application.controllers.main.nosotros.Nosotros',
    '/registro','application.controllers.main.registro.Registro',
    '/usuarios','application.controllers.main.registroUsuarios.RegistroUsuarios',
    '/contacto','application.controllers.main.contactanos.Contactanos',
    '/restaurante/(.*)','application.controllers.main.restaurante.Restaurante',
    '/platillo/(.*)','application.controllers.main.view.View',
    '/local/(.*)','application.controllers.main.local.Local',
    '/usuarios/restaurante','application.controllers.restaurante.index.Index',
    '/usuarios/restaurante/platillos/(.*)','application.controllers.restaurante.platillos.Platillos',
    '/usuarios/restaurante/insertar/(.*)','application.controllers.restaurante.insertar.Insertar',
    '/usuarios/restaurante/editar/(.*)','application.controllers.restaurante.editar.Editar',
    '/usuarios/restaurante/eliminar/(.*)','application.controllers.restaurante.eliminar.Eliminar',
    '/registrar/cliente','application.controllers.main.registrar.Clientes',
    '/registrar/negocio','application.controllers.main.registrar.Negocios',
    '/registrar/restaurante','application.controllers.main.registrar.Restaurantes',
    '/usuarios/locales','application.controllers.locales.index.Index',
    '/usuarios/locales/productos/(.*)','application.controllers.locales.productos.Productos',
    '/usuarios/locales/insertar/(.*)','application.controllers.locales.insertar.Insertar',
    '/usuarios/locales/editar/(.*)','application.controllers.locales.editar.Editar',
    '/usuarios/locales/eliminar/(.*)','application.controllers.locales.eliminar.Eliminar',
    '/carrito','application.controllers.carrito.index.Index',
)

app = web.application(urls, globals())


if __name__ == "__main__":
    app.run()