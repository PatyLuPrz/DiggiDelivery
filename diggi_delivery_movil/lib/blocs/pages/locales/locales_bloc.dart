import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/providers/locales_provider.dart';
import 'package:rxdart/rxdart.dart';

class LocalesBloc {
  //Streamcontroller
  final _localesController = new BehaviorSubject<QuerySnapshot>();
  final _cargandoController = new BehaviorSubject<bool>();

  //Referencia para realizar la petición a cada proceso
  final _productoProvider = new LocalesProvider();

  //Escuchar streams
  Stream<QuerySnapshot> get localesStream =>
      _localesController.stream;
  Stream<bool> get cargando => _cargandoController.stream;

  //Implementar metodos para cargar, agregar, etc, productos
  void cargarLocales() async {
    // final locales = await _productoProvider.getLocales();
    // _localesController.sink.add(locales);
    _productoProvider.getLocales().listen((event) {_localesController.add(event);});
  }

  dispose() {
    _cargandoController.close();
    _localesController.close();
  }
}
