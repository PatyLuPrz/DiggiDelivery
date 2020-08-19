import 'package:diggi_delivery_movil/blocs/archivos_bloc.dart';
import 'package:diggi_delivery_movil/blocs/pages/Login/registro_bloc.dart';
import 'package:diggi_delivery_movil/blocs/pages/locales/locales_bloc.dart';
import 'package:diggi_delivery_movil/blocs/pages/pedidos/pedidos_bloc.dart';
import 'package:diggi_delivery_movil/blocs/pages/restaurantes/restaurantes_bloc.dart';
import 'package:flutter/material.dart';

export 'Login/registro_bloc.dart';

class Provider extends InheritedWidget {
  static Provider _instancia;

  final _localesBloc = LocalesBloc();
  final _restaurantesBloc = RestaurantesBloc();
  final registroBloc = RegistroBloc();
  final _archivosBloc = ArchivosBloc();
  final _pedidosBloc = PedidosBloc();

  // Determinar si necesita una nueva instancia
  factory Provider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(key: key, child: child);
    }
    return _instancia;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  // Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  //Login y registro de usuarios, clientes, restaurantes y locales
  static RegistroBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().registroBloc;
  }

  //LocalesBloc
  static LocalesBloc localesBloc(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()._localesBloc;
  }

  //LocalesBloc
  static RestaurantesBloc restaurantesBloc(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<Provider>()
        ._restaurantesBloc;
  }

  //LocalesBloc
  static PedidosBloc pedidosBloc(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()._pedidosBloc;
  }

  //Archivos_BLoC para subir archivos al servidor
  static ArchivosBloc archivosBloc(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()._archivosBloc;
  }
}
