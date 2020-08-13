import 'dart:async';

import 'package:diggi_delivery_movil/validators/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegistroBloc with Validators {
  final _emailController = StreamController<String>.broadcast();
  final _emailControllerlog = BehaviorSubject<String>();
  final _passwordControllerlog = BehaviorSubject<String>();

  //Recuperar los datos del Stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);

  Stream<String> get emailStreamlog =>
      _emailControllerlog.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordControllerlog.stream.transform(validarPassword);

  //Insertar valores al String
  Function(String) get changeEmail => _emailController.sink.add;

  Function(String) get changeEmaillog => _emailControllerlog.sink.add;
  Function(String) get changePassword => _passwordControllerlog.sink.add;

  //Ultimo valor emitido
  String get emaillog => _emailControllerlog.value;
  String get password => _passwordControllerlog.value;

  // cerrar
  dispose() {
    _emailController?.close();
    _emailControllerlog?.close();
    _passwordControllerlog?.close();
  }

  Stream<bool> get formValidStream =>
      CombineLatestStream.combine2(emailStreamlog, passwordStream, (a, b) => true);
}
