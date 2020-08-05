import 'package:mapbox_gl/mapbox_gl.dart';

abstract class MapaRegistroEvents {}

class OnMyLocationUpdate extends MapaRegistroEvents {
  final LatLng location;

  OnMyLocationUpdate(this.location);

  
}
