import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/models/platillo_model.dart';
import 'package:diggi_delivery_movil/providers/restaurantes_provider.dart';
import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart';
import 'package:rxdart/rxdart.dart';

class RestaurantesBloc {
  final prefs = new PreferenciasUsuario();
  //Streamcontroller
  final _restaurantesController = new BehaviorSubject<QuerySnapshot>();
  final _restaurantesControllerPlatillos =
      new BehaviorSubject<List<PlatillosModel>>();
  final _cargandoController = new BehaviorSubject<bool>();

  //Referencia para realizar la petición a cada proceso
  final _restaurantesProvider = new RestaurantesProvider();

  //Escuchar streams
  Stream<QuerySnapshot> get localesStream => _restaurantesController.stream;
  Stream<List<PlatillosModel>> get platillosStream =>
      _restaurantesControllerPlatillos.stream;
  Stream<bool> get cargando => _cargandoController.stream;

  //Implementar metodos para cargar, agregar, etc, productos
  void cargarRestaurantes() async {
    // final locales = await _restaurantesProvider.getLocales();
    // _restaurantesController.sink.add(locales);
    // _restaurantesProvider.getRestaurantes().listen((event) {
    //   _restaurantesController.add(event);
    // });
  }

  //Implementar metodos para cargar, agregar, etc, productos
  void cargarPlatillos() async {
    final platillos =
        await _restaurantesProvider.getPlatilloRestaurante(prefs.email);
    _restaurantesControllerPlatillos.sink.add(platillos);
  }

  dispose() {
    _cargandoController.close();
    _restaurantesController.close();
    _restaurantesControllerPlatillos.close();
  }
}
