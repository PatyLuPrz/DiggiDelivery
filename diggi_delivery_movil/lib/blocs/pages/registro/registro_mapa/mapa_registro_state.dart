import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaRegistroState extends Equatable {
  final LatLng myLocation;
  final bool loading;
  final Map<MarkerId, Marker> marker = Map();

  //Constructor
  MapaRegistroState({this.myLocation, this.loading = true});

  //Retornar instacia de MapaRegistroState
  MapaRegistroState copyWith({LatLng myLocation, bool loading,Map<MarkerId, Marker> marker}) {
    //Retorna un copia del estado sin modificar otras propiedades que se pueden definir en otro lado
    return MapaRegistroState(
      myLocation: myLocation ?? this.myLocation,
      loading: loading ?? this.loading,
    );
  }

  @override
  // Compara si una instancia de la clase es igual a otra instancia de la misma clase 
  List<Object> get props => [
        myLocation,
        loading,
        marker,
      ];

}
