import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  //Instancia unica de las preferencias del usuario

  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  clear() async {
    this._prefs.clear();
  }

  //Get And Set Genero
  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  //Get And Set colorSecundario
  get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? true;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  //Get And Set de la ultima pagina
  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'login';
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }

  //Get and Set de la ubicación del lugar de registro
  get latitud {
    return _prefs.getString('latitud') ?? '';
  }

  set latitud(String value) {
    _prefs.setString('latitud', value);
  }

  get logitud {
    return _prefs.getString('logitud') ?? '';
  }

  set logitud(String value) {
    _prefs.setString('logitud', value);
  }

  //Get And Set Correo
  get email {
    return _prefs.getString('email') ?? '';
  }

  set email(String value) {
    _prefs.setString('email', value);
  }

  //Get And Set Correo
  get nivelUsuario {
    return _prefs.getString('nivelUsuario') ?? '';
  }

  set nivelUsuario(String value) {
    _prefs.setString('nivelUsuario', value);
  }

  //Get And Set Nombre de usuario
  get nombre {
    return _prefs.getString('nombre') ?? '';
  }

  set nombre(String value) {
    _prefs.setString('nombre', value);
  }

  //Geta and Set Token
  get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String value) {
    _prefs.setString('token', value);
  }

  //Geta and Set idLocal de firebase
  get idLocal {
    return _prefs.getString('idLocal') ?? '';
  }

  set idLocal(String value) {
    _prefs.setString('idLocal', value);
  }

  //Geta and Set FotoPathRegistro
  get foto {
    return _prefs.getString('foto') ?? '';
  }

  set foto(String value) {
    _prefs.setString('foto', value);
  }

  //Geta and Set FotoPathRegistro
  get fotoURLCrud {
    return _prefs.getString('fotoURLCrud') ?? '';
  }

  set fotoURLCrud(String value) {
    _prefs.setString('fotoURLCrud', value);
  }

  //Geta and Set FotoURL
  get fotoURL {
    return _prefs.getString('fotoURL') ?? '';
  }

  set fotoURL(String value) {
    _prefs.setString('fotoURL', value);
  }

  //Get And Set Correo - idRestaurante
  get idRestaurante {
    return _prefs.getString('idRestaurante') ?? '';
  }

  set idRestaurante(String value) {
    _prefs.setString('idRestaurante', value);
  }

  //Get And Set Correo - idRestaurante
  get nombreRestaurantes {
    return _prefs.getString('nombreRestaurantes') ?? '';
  }

  set nombreRestaurantes(String value) {
    _prefs.setString('nombreRestaurantes', value);
  }

  //Get And Set Correo - idRestaurante
  get idUpdateRegistro {
    return _prefs.getString('idUpdateRegistro') ?? '';
  }

  set idUpdateRegistro(String value) {
    _prefs.setString('idUpdateRegistro', value);
  }

  /*PARTE PARA PEDIDOS DATOS */
  //PRECIO TOTAL EN EL CARRITO DE COMPRAS
  get total {
    return _prefs.getInt('total') ?? 0;
  }

  set total(int value) {
    _prefs.setInt('total', value);
  }

  //ID DEL DOCUMENTO DE PLATILLO O PRODUCTO
  get idDocumentPlatilloProducto {
    return _prefs.getString('idDocumentPlatilloProducto') ?? '';
  }

  set idDocumentPlatilloProducto(String value) {
    _prefs.setString('idDocumentPlatilloProducto', value);
  }

  //ID DEL DOCUMENTO DE PLATILLO O PRODUCTO
  get correoEstablecimientoRestaurante {
    return _prefs.getString('correoEstablecimientoRestaurante') ?? '';
  }

  set correoEstablecimientoRestaurante(String value) {
    _prefs.setString('correoEstablecimientoRestaurante', value);
  }
}
