import 'package:equatable/equatable.dart';
import 'package:mapbox_gl/mapbox_gl.dart' show LatLng;

class MapaRegistroState extends Equatable {
  final LatLng myLocation;
  final bool loading;

  //Constructor
  MapaRegistroState({this.myLocation, this.loading = true});

  //Retornar instacia de MapaRegistroState
  MapaRegistroState copyWith({LatLng myLocation, bool loading}) {
    //Retorna un copia del estado sin modificar otras propiedades que se pueden definir en otro lado
    return MapaRegistroState(
      myLocation: myLocation ?? this.myLocation,
      loading: loading ?? this.loading,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [myLocation];
}
