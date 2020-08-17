import 'package:diggi_delivery_movil/models/platillo_model.dart';
import 'package:diggi_delivery_movil/providers/restaurantes_provider.dart';
import 'package:rxdart/rxdart.dart';

class RestaurantesBloc {
  //Streamcontroller
  final _restaurantesController = new BehaviorSubject<List<PlatillosModel>>();
  final _cargandoController = new BehaviorSubject<bool>();

  //Referencia para realizar la petición a cada proceso
  final _restaurantesProvider = new RestaurantesProvider();

  //Escuchar streams
  Stream<List<PlatillosModel>> get localesStream => _restaurantesController.stream;
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
  // void cargarProductos(String email) async {
  //   final productos = await _restaurantesProvider.getPlatilloRestaurante(email);
  //   _restaurantesController.sink.add(productos);
  // }

  dispose() {
    _cargandoController.close();
    _restaurantesController.close();
  }
}
