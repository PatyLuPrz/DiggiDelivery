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
  final _restaurantesControllerPlatillos =
      new BehaviorSubject<List<PlatillosModel>>();
  final _restaurantesControllerPlatillosCliente =
      new BehaviorSubject<List<PlatillosModel>>();
  final _cargandoController = new BehaviorSubject<bool>();

  //Referencia para realizar la petición a cada proceso
  final _restaurantesProvider = new RestaurantesProvider();

  //Escuchar streams
  Stream<List<RestauranteModel>> get restaurantesStream => _restaurantesController.stream;
  Stream<List<PlatillosModel>> get platillosStream =>
      _restaurantesControllerPlatillos.stream;
  Stream<List<PlatillosModel>> get platillosClienteStream =>
      _restaurantesControllerPlatillosCliente.stream;
  Stream<bool> get cargando => _cargandoController.stream;

  //Implementar metodos para cargar, agregar, etc, productos
  void cargarRestaurantes() async {
    final restaurantes =
        await _restaurantesProvider.getRestaurantes();
    _restaurantesController.sink.add(restaurantes);
  }

  //Implementar metodos para cargar, agregar, etc, productos
  void cargarPlatillos() async {
    final platillos =
        await _restaurantesProvider.getPlatilloRestaurante(prefs.email);
    _restaurantesControllerPlatillos.sink.add(platillos);
  }
  //Implementar metodos para cargar, agregar, etc, productos
  void cargarPlatillosCliente() async {
    final platillos =
        await _restaurantesProvider.getPlatilloRestaurante(prefs.idRestaurante);
    _restaurantesControllerPlatillosCliente.sink.add(platillos);
  }

  dispose() {
    _cargandoController.close();
    _restaurantesController.close();
    _restaurantesControllerPlatillos.close();
    _restaurantesControllerPlatillosCliente.close();
  }
}
