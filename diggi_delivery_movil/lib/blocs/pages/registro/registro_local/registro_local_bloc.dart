import 'dart:async';

import 'package:diggi_delivery_movil/validators/validators.dart';

class RegistroLocalBloc with Validators {
  final _emailController = StreamController<String>.broadcast();

  //Recuperar los datos del Stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);

  //Insertar valores al String
  Function(String) get changeEmail => _emailController.sink.add;

  // cerrar
  dispose() {
    _emailController?.close();
  }
}