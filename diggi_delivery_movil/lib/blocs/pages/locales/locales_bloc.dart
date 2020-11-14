import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/models/locales_model.dart';
import 'package:diggi_delivery_movil/models/producto_model.dart';
import 'package:diggi_delivery_movil/providers/locales_provider.dart';
import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart';
import 'package:rxdart/rxdart.dart';

class LocalesBloc {
  final prefs = new PreferenciasUsuario();
  //Streamcontroller
  final localesController = new BehaviorSubject<List<LocalesModel>>();
  final localesControllerProductos = new BehaviorSubject<QuerySnapshot>();
  final localesControllerProductosUid = new BehaviorSubject<ProductoModel>();
  final localesControllerProductosCliente =
      new BehaviorSubject<QuerySnapshot>();
  final _cargandoController = new BehaviorSubject<bool>();

  //Referencia para realizar la petición a cada proceso
  final _localesProvider = new LocalesProvider();

  //Escuchar streams
  Stream<List<LocalesModel>> get localesStream => localesController.stream;
  //Stream de prodctos en la pantalla de local
  Stream<QuerySnapshot> get productosStream =>
      localesControllerProductos.stream;
  //Stream de prodctos en la pantalla de local
  Stream<ProductoModel> get getProductosUid =>
      localesControllerProductosUid.stream;
  //Stream de productos que se muestran al cliente
  Stream<QuerySnapshot> get productosClienteStream =>
      localesControllerProductosCliente.stream;
  Stream<bool> get cargando => _cargandoController.stream;

  //Implementar metodos para cargar, agregar, etc, productos
  void cargarLocales() async {
    final restaurantes = await _localesProvider.getLocales();
    localesController.sink.add(restaurantes);
  }

  //Cargar los platillos que se le mostraran al cliente
  void cargarProductosCliente() async {
    final platillos =
        await _localesProvider.getProductosLocales(prefs.idRestaurante);
    localesControllerProductosCliente.sink.add(platillos);
  }

  //Cargar los productos a mostrar al restaurante
  void cargarProductos() async {
    final platillos = await _localesProvider.getProductoLocal(prefs.email);
    localesControllerProductos.sink.add(platillos);
  }

  //Agregar nuevo producto
  void agregarProducto(ProductoModel productoModel) async {
    _cargandoController.sink.add(true);
    await _localesProvider.crearProducto(productoModel);
    _cargandoController.sink.add(false);
  }

  //Editar producto
  void editarProducto(ProductoModel productoModel) async {
    _cargandoController.sink.add(true);
    await _localesProvider.editarProducto(productoModel);
    _cargandoController.sink.add(false);
  }

  //Obtener producto por uid
  void obtenerProductoPUID(String idDocument) async {
    _cargandoController.sink.add(true);
    final prod = await _localesProvider.listaProductoPedido(idDocument);
    localesControllerProductosUid.add(prod);
    _cargandoController.sink.add(false);
  }

  dispose() {
    localesController.close();
    _cargandoController.close();
    localesControllerProductos.close();
    localesControllerProductosCliente.close();
    localesControllerProductosUid.close();
  }
}
