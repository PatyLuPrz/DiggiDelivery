import 'package:diggi_delivery_movil/blocs/pages/Login/registro_bloc.dart';
import 'package:diggi_delivery_movil/blocs/pages/locales/locales_bloc.dart';
import 'package:flutter/material.dart';

export 'registro_bloc.dart';

class Provider extends InheritedWidget {
  static Provider _instancia;

  final _localesBloc = new LocalesBloc();

  // Determinar si necesita una nueva instancia
  factory Provider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(key: key, child: child);
    }
    return _instancia;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  final registroBloc = RegistroBloc();

  // Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static RegistroBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().registroBloc;
  }

  //LocalesBloc
  static LocalesBloc localesBloc(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()._localesBloc;
  }
}
