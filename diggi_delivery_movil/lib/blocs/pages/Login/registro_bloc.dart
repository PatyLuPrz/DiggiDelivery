import 'dart:async';

import 'package:diggi_delivery_movil/models/locales_model.dart';
import 'package:diggi_delivery_movil/models/model_usuarios.dart';
import 'package:diggi_delivery_movil/providers/usuario_provider.dart';
import 'package:diggi_delivery_movil/validators/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegistroBloc with Validators {
  final _usuarioProvider = UsuarioProvider();

  //StreamController
  final _emailController = StreamController<String>.broadcast();
  final _emailControllerlog = BehaviorSubject<String>();
  final _passwordControllerlog = BehaviorSubject<String>();
  final _cargandoController = BehaviorSubject<bool>();

  //Recuperar los datos del Stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get emailStreamlog =>
      _emailControllerlog.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordControllerlog.stream.transform(validarPassword);
  Stream<bool> get cargando => _cargandoController.stream;

  //Insertar valores al String
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changeEmaillog => _emailControllerlog.sink.add;
  Function(String) get changePassword => _passwordControllerlog.sink.add;

  //Ultimo valor emitido
  String get emaillog => _emailControllerlog.value;
  String get password => _passwordControllerlog.value;

  Stream<bool> get formValidStream => CombineLatestStream.combine2(
      emailStreamlog, passwordStream, (a, b) => true);

  //AGREGAR NUEVO ESTABLECIMIENTO
  void agregarNuevoLocal(RegistroLocalModel registroLocalModel) async {
    _cargandoController.sink.add(true);
    await _usuarioProvider.crearNuevoLocal(registroLocalModel);
    _cargandoController.sink.add(false);
  }

  // cerrar
  dispose() {
    _emailController?.close();
    _emailControllerlog?.close();
    _passwordControllerlog?.close();
    _cargandoController?.close();
  }
}
