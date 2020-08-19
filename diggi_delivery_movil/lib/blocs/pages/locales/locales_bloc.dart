import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/models/locales_model.dart';
import 'package:diggi_delivery_movil/providers/locales_provider.dart';
import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart';
import 'package:rxdart/rxdart.dart';

class LocalesBloc {
  final prefs = new PreferenciasUsuario();
  //Streamcontroller
  final _localesController = new BehaviorSubject<List<LocalesModel>>();
  final _localesControllerProductos = new BehaviorSubject<QuerySnapshot>();
  final _localesControllerProductosCliente =
      new BehaviorSubject<QuerySnapshot>();
  final _cargandoController = new BehaviorSubject<bool>();

  //Referencia para realizar la petición a cada proceso
  final _localesProvider = new LocalesProvider();

  //Escuchar streams
  Stream<List<LocalesModel>> get localesStream => _localesController.stream;
  //Stream de prodctos en la pantalla de local
  Stream<QuerySnapshot> get productosStream =>
      _localesControllerProductos.stream;
  //Stream de productos que se muestran al cliente
  Stream<QuerySnapshot> get productosClienteStream =>
      _localesControllerProductosCliente.stream;
  Stream<bool> get cargando => _cargandoController.stream;

  //Implementar metodos para cargar, agregar, etc, productos
  void cargarLocales() async {
    final restaurantes = await _localesProvider.getLocales();
    _localesController.sink.add(restaurantes);
  }

  //Cargar los platillos que se le mostraran al cliente
  void cargarProductosCliente() async {
    final platillos =
        await _localesProvider.getProductosLocales(prefs.idRestaurante);
    _localesControllerProductosCliente.sink.add(platillos);
  }

  //Cargar los productos a mostrar al restaurante
  void cargarProductos() async {
    final platillos = await _localesProvider.getProductoLocal(prefs.email);
    _localesControllerProductos.sink.add(platillos);
  }

  dispose() {
    _localesController.close();
    _cargandoController.close();
    _localesControllerProductos.close();
    _localesControllerProductosCliente.close();
  }
}
