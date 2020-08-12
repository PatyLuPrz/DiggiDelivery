import 'package:diggi_delivery_movil/blocs/pages/registro/registro_local/registro_local_bloc.dart';
import 'package:flutter/material.dart';

class RegistroLocalProvider extends InheritedWidget {
  static RegistroLocalProvider _instancia;

  // Determinar si necesita una nueva instancia
  factory RegistroLocalProvider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new RegistroLocalProvider._internal(key: key, child: child);
    }
    return _instancia;
  }

  RegistroLocalProvider._internal({Key key, Widget child})
      : super(key: key, child: child);

  final registroLocalBloc = RegistroLocalBloc();


  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static RegistroLocalBloc of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<RegistroLocalProvider>()
        .registroLocalBloc;
  }
}
