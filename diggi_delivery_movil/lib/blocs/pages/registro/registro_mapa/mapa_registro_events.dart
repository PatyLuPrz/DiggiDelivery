

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

abstract class MapaRegistroEvents {}

class OnMyLocationUpdate extends MapaRegistroEvents {
  final LatLng location;
  OnMyLocationUpdate(this.location);
}
