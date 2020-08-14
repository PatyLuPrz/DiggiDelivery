import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UsuarioProvider {
  final _firebaseToken = 'AIzaSyCRgTvKgLZVLLoeiL6J7lI4O5lwAwXqEVo';
  final _prefs = new PreferenciasUsuario();

  //Inicio de sesión
  Future<Map<String, dynamic>> login(String email, String password) async {
    final prefs = new PreferenciasUsuario();
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken',
      body: json.encode(authData),
    );

    Map<String, dynamic> decodeResp = json.decode(resp.body);

    prefs.email = decodeResp["email"];
    prefs.token = decodeResp["idToken"];
    prefs.idLocal = decodeResp["localId"];
    print(decodeResp);

    if (decodeResp.containsKey('idToken')) {
      _prefs.token = decodeResp['idToken'];
      return {'ok': true, 'token': decodeResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodeResp['error']['message']};
    }
  }

  //Nuevo usuario
  Future<Map<String, dynamic>> nuevoUsuario(
      String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
      body: json.encode(authData),
    );

    Map<String, dynamic> decodeResp = json.decode(resp.body);

    print(decodeResp);

    if (decodeResp.containsKey('idToken')) {
      _prefs.token = decodeResp['idToken'];
      return {'ok': true, 'token': decodeResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodeResp['error']['message']};
    }
  }
}