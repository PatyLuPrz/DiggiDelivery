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

  //Get And Set Genero
  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  //Get And Set colorSecundario
  get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  //Get And Set de la ultima pagina
  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'home';
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

  //Geta and Set Token
  get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String value) {
    _prefs.setString('token', value);
  }

  //Geta and Set Token
  get idLocal {
    return _prefs.getString('idLocal') ?? '';
  }

  set idLocal(String value) {
    _prefs.setString('idLocal', value);
  }

  //Geta and Set Token
  get foto {
    return _prefs.getString('foto') ?? '';
  }

  set foto(String value) {
    _prefs.setString('foto', value);
  }
}
