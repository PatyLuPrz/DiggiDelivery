// import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:permission_handler/permission_handler.dart';

class ModelLocation {
  Future<void> _request() async {
    final PermissionStatus status =
        await Permission.locationWhenInUse.request();

    print("STATUS :::::::::::::::::::::::: $status");

    switch (status) {
      case PermissionStatus.undetermined:
        
        break;
      case PermissionStatus.granted:
        
        break;
      case PermissionStatus.denied:
        
        break;
      case PermissionStatus.restricted:
        
        break;
      case PermissionStatus.permanentlyDenied:
        
        break;
    }
  }

  // LocationData _locationData;

  // ubicacion() async {
  //   Location location = new Location();

  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;

  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }

  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }

  //   _locationData = await location.getLocation();
  // }

  // LatLng getLatLng() {
  //   ubicacion();
  //   if (_locationData != null) {
  //     final latitud = _locationData.latitude;
  //     final longitud = _locationData.longitude;
  //     print(longitud);
  //     print(latitud);
  //     return LatLng(latitud, longitud);
  //   }
  // }

}
