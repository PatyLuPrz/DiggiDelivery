import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/providers/locales_provider.dart';
import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart';
import 'package:rxdart/rxdart.dart';

class LocalesBloc {
  final prefs = new PreferenciasUsuario();
  //Streamcontroller
  final _localesController = new BehaviorSubject<QuerySnapshot>();
  final _localesControllerProductos = new BehaviorSubject<QuerySnapshot>();

  final _cargandoController = new BehaviorSubject<bool>();

  //Referencia para realizar la petición a cada proceso
  final _localesProvider = new LocalesProvider();

  //Escuchar streams
  Stream<QuerySnapshot> get localesStream => _localesController.stream;
  //Stream de prodctos en la pantalla de local
  Stream<QuerySnapshot> get platillosStream =>
      _localesControllerProductos.stream;
  Stream<bool> get cargando => _cargandoController.stream;

  //Implementar metodos para cargar, agregar, etc, productos
  void cargarLocales() async {
    // final locales = await _localesProvider.getLocales();
    // _localesController.sink.add(locales);
    _localesProvider.getLocales().listen((event) {
      _localesController.add(event);
    });
  }

  //Cargar los platillos a mostrar al restaurante
  void cargarProductos() async {
    final platillos = await _localesProvider.getProductoLocal(prefs.email);
    _localesControllerProductos.sink.add(platillos);
  }

  dispose() {
    _localesController.close();
    _cargandoController.close();
    _localesControllerProductos.close();
  }
}
