import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/models/cliente_model.dart';
import 'package:diggi_delivery_movil/models/locales_model.dart';
import 'package:diggi_delivery_movil/models/model_usuarios.dart';
import 'package:diggi_delivery_movil/models/restaurante_model.dart';
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

  //Consultar correo si esta registrado para obener los datos de la tabla de usuarios con su nivel para el inicio de sesión
  Firestore _db = Firestore();

  Future<Map<String, dynamic>> getEmail(String email) async {
    QuerySnapshot result = await _db
        .collection("usuarios")
        .where("email", isEqualTo: email)
        .getDocuments();

    Map<String, dynamic> decodeResp;

    result.documents.forEach((DocumentSnapshot res) {
      return decodeResp = res.data;
    });

    if (decodeResp != null) {
      return {'ok': true, 'mensaje': 'Este correo ya esta registrado'};
    } else {
      return {
        'ok': false,
        'email': decodeResp['email'],
        'nivel': decodeResp['nivel']
      };
    }
  }

  //Valida cuando un correo ya se encuentra registrado en la pantalla de registro
  Future<Map<String, dynamic>> getEmailRegistro(String email) async {
    QuerySnapshot result = await _db
        .collection("usuarios")
        .where("email", isEqualTo: email)
        .getDocuments();

    Map<String, dynamic> decodeResp;

    result.documents.forEach((DocumentSnapshot res) {
      return decodeResp = res.data;
    });

    if (decodeResp != null) {
      return {'ok': true, 'mensaje': 'Este correo ya esta registrado'};
    } else {
      return {
        'ok': false,
      };
    }
  }

  //Valida el correo regitrado en la pantalla de login
  Future<Map<String, dynamic>> getEmailLogin(String email) async {
    QuerySnapshot result = await _db
        .collection("usuarios")
        .where("email", isEqualTo: email)
        .getDocuments();

    Map<String, dynamic> decodeResp;

    result.documents.forEach((DocumentSnapshot res) {
      return decodeResp = res.data;
    });

    if (decodeResp != null) {
      return {
        'ok': false,
        'email': decodeResp['email'],
        'nivel': decodeResp['nivel']
      };
    } else {
      return {'ok': true, 'mensaje': 'Este correo ya esta registrado'};
    }
  }

  //Obtiene el nombre de usuario de su respectiva tabla
  Future<Map<String, dynamic>> getNombreUsuario(String email, String collection) async {
    QuerySnapshot result = await _db
        .collection(collection)
        .where("email", isEqualTo: email)
        .getDocuments();

    Map<String, dynamic> decodeResp;

    result.documents.forEach((DocumentSnapshot res) {
      return decodeResp = res.data;
    });

    if (decodeResp != null) {
      return {
        'ok': false,
        'nombre': decodeResp['nombre'],
        'foto': decodeResp['foto']
      };
    } else {
      return {'ok': true, 'mensaje': 'Este correo ya esta registrado'};
    }
  }

  //Nuevo establecimiento
  Future<bool> crearNuevoLocal(LocalesModel _localesModel) async {
    await _db
        .collection('locales')
        .document()
        .setData(_localesModel.toMap());
    return true;
  }

  //Nuevo establecimiento
  Future<bool> crearNuevoRestaurante(RestauranteModel restauranteModel) async {
    await _db
        .collection('restaurantes')
        .document()
        .setData(restauranteModel.toMap());
    return true;
  }

  //Nuevo cliente
  Future<bool> crearNuevoCliente(ClienteModel clienteModel) async {
    await _db.collection('clientes').document().setData(clienteModel.toMap());
    return true;
  }

  //Nuevo usuario
  Future<bool> crearNuevoUsuario(ModelUsuarios modelUsuarios) async {
    await _db.collection('usuarios').document().setData(modelUsuarios.toMap());
    return true;
  }
}
