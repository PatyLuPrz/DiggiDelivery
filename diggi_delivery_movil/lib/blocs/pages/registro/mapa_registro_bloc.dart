import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'mapa_registro_events.dart';
import 'mapa_registro_state.dart';

class MapaRegistroBloc extends Bloc<MapaRegistroEvents, MapaRegistroState> {
  //Instancia de ubicacion
  Geolocator _geolocator = Geolocator();
  // MapasApi mapasAspi = MapasApi();
  final Completer<GoogleMapController> _completer = Completer();

  //Propiedade locationoptions, para recibir por distancia la ubicación
  final LocationOptions _locationOptions =
      LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

  //PErmite detener la escucha en los cambios de ubicación para no tener peridida de memoria y se detenga la app
  StreamSubscription<Position> _subscription;

  MapaRegistroBloc() {
    this._init();
  }

  //Se sobreescribe el metodo close de la clase BLoC
  @override
  Future<void> close() async {
    //Libreación de recursos
    _subscription?.cancel();
    //Llama al metodo close de la clase padre
    super.close();
  }

  _init() async {
    _subscription =
        _geolocator.getPositionStream(_locationOptions).listen((position) {
      print(position);
      if (position != null) {
        //Se agrega la latitud y longitud por medio del BLoC
        add(OnMyLocationUpdate(LatLng(position.latitude, position.longitude)));
        print("Add Location::::::::::");
      }
    });
  }

  //Controller del mapa
  setMapController(GoogleMapController mapController) {
    _completer.complete(mapController);
  }

  //Controller del estado del mapa
  Future<GoogleMapController> get _googleMapController async {
    return await _completer.future;
  }

  @override
  Stream<MapaRegistroState> mapEventToState(MapaRegistroEvents event) async* {
    if (event is OnMyLocationUpdate) {
      yield this.state.copyWith(
            loading: false,
            myLocation: event.location,
          );
    }
  }

  @override
  // TODO: implement initialState
  MapaRegistroState get initialState => MapaRegistroState();
}
