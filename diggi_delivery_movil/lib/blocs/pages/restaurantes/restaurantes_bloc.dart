import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/models/platillo_model.dart';
import 'package:diggi_delivery_movil/models/restaurante_model.dart';
import 'package:diggi_delivery_movil/providers/restaurantes_provider.dart';
import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart';
import 'package:rxdart/rxdart.dart';

class RestaurantesBloc {
  final prefs = new PreferenciasUsuario();
  //Streamcontroller
  final _restaurantesController = new BehaviorSubject<List<RestauranteModel>>();
  final _restaurantesControllerPlatillos = new BehaviorSubject<QuerySnapshot>();
  final _restaurantesControllerPlatillosCliente =
      new BehaviorSubject<QuerySnapshot>();
  final _crearPlatillo = new BehaviorSubject<List<PlatillosModel>>();
  final _editarPlatillo = new BehaviorSubject<List<PlatillosModel>>();
  final _cargandoController = new BehaviorSubject<bool>();

  //Referencia para realizar la petición a cada proceso
  final _restaurantesProvider = new RestaurantesProvider();

  //Escuchar streams
  //Stream de restaurantes
  Stream<List<RestauranteModel>> get restaurantesStream =>
      _restaurantesController.stream;
  //Stream de platillos
  Stream<QuerySnapshot> get platillosStream =>
      _restaurantesControllerPlatillos.stream;
  //Stream de platillos que se muestran al cliente
  Stream<QuerySnapshot> get platillosClienteStream =>
      _restaurantesControllerPlatillosCliente.stream;
  //Stream para poder crear platillos
  Stream<List<PlatillosModel>> get crearPlatilloStream => _crearPlatillo.stream;
  //Stream para editar platillos
  Stream<List<PlatillosModel>> get editarPlatilloStream =>
      _editarPlatillo.stream;
  //Valida la carga del stream
  Stream<bool> get cargando => _cargandoController.stream;

  //Carga los restaurantes para mostrarlos al cliente
  void cargarRestaurantes() async {
    final restaurantes = await _restaurantesProvider.getRestaurantes();
    _restaurantesController.sink.add(restaurantes);
  }

  //Cargar los platillos a mostrar al restaurante
  void cargarPlatillos() async {
    final platillos =
        await _restaurantesProvider.getPlatilloRestaurante(prefs.email);
    _restaurantesControllerPlatillos.sink.add(platillos);
  }

  //Cargar los platillos que se le mostraran al cliente
  void cargarPlatillosCliente() async {
    final platillos =
        await _restaurantesProvider.getPlatilloRestaurante(prefs.idRestaurante);
    _restaurantesControllerPlatillosCliente.sink.add(platillos);
  }

  //Agregar nuevo platillo
  void agregarProducto(PlatillosModel platillosModel) async {
    _cargandoController.sink.add(true);
    await _restaurantesProvider.crearPlatillo(platillosModel);
    _cargandoController.sink.add(false);
  }

  //Editar platillo existente
  void editarProducto(PlatillosModel platillosModel) async {
    _cargandoController.sink.add(true);
    await _restaurantesProvider.editarPlatillo(platillosModel);
    _cargandoController.sink.add(false);
  }

  dispose() {
    _editarPlatillo.close();
    _crearPlatillo..close();
    _cargandoController.close();
    _restaurantesController.close();
    _restaurantesControllerPlatillos.close();
    _restaurantesControllerPlatillosCliente.close();
  }
}
