// // import 'package:location/location.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';

// class MapasApi {
//   static final String api_key =
//       'pk.eyJ1Ijoibm9yYmVydG9wcjE5OTgiLCJhIjoiY2tjZjRyazJvMGM5YjJ5bWthN2FoN2JwcCJ9.-jdajP7EboeREWDxEvpwZg';

//   // Location location = new Location();
//   // bool _serviceEnabled;
//   // PermissionStatus _permissionGranted;

//   LatLng center;

//   // ubicacion() async {
//   //   _serviceEnabled = await location.serviceEnabled();
//   //   if (!_serviceEnabled) {
//   //     _serviceEnabled = await location.requestService();
//   //     if (!_serviceEnabled) {
//   //       return;
//   //     }
//   //   }

//     // _permissionGranted = await location.hasPermission();
//     // if (_permissionGranted == PermissionStatus.denied) {
//     //   _permissionGranted = await location.requestPermission();
//     //   if (_permissionGranted != PermissionStatus.granted) {
//     //     return;
//     //   }
//     // }

    
//   }

//   Future<LatLng> getUserLocation() async {
//     var currentLocation = <String, double>{};
//     try {
//       currentLocation = await ubicacion();
//       final lat = currentLocation["latitude"];
//       final lng = currentLocation["longitude"];
//       final center = LatLng(lat, lng);
//       return center;
//     } on Exception {
//       currentLocation = null;
//       return null;
//     }
//   }
// }
