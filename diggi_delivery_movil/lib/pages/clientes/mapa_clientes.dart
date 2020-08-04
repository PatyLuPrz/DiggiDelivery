import 'package:diggi_delivery_movil/models/model_mapbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
// import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapaClientes extends StatefulWidget {
  final String nombre;

  const MapaClientes({Key key, this.nombre}) : super(key: key);

  @override
  _MapaClientesState createState() => _MapaClientesState();
}

class _MapaClientesState extends State<MapaClientes> {
  MapasApi mapasApi = MapasApi();
  MapboxMapController mapController;
  @override
  Widget build(BuildContext context) {
    mapasApi.ubicacion();
    return Scaffold(
      appBar: AppBar(title: const Text('Location')),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: MapboxMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
              target: LatLng(20.1139257, -98.4166494), zoom: 15.0),
        ),
      ),
    );
  }

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  // LatLng _latlong(MapasApi mapasApi) {
  //   mapasApi.location.onLocationChanged.listen((LocationData currentLocation) {
  //     // Use current location
  //     mapasApi.getUserLocation();
  //   });
  //   print(mapasApi.center);
  //   return mapasApi.center;
  // }
}
