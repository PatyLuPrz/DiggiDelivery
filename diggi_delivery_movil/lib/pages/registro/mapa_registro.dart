import 'package:diggi_delivery_movil/models/model_location.dart';
import 'package:diggi_delivery_movil/models/model_mapbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
// import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapaRegistro extends StatefulWidget {
  final String nombre;

  const MapaRegistro({Key key, this.nombre}) : super(key: key);

  @override
  _MapaRegistroState createState() => _MapaRegistroState();
}

class _MapaRegistroState extends State<MapaRegistro> {
  bool loc = true;
  // MapasApi mapasAspi = MapasApi();
  MapboxMapController mapController;
  @override
  Widget build(BuildContext context) {
    ModelLocationPermission modelLocationPermission = ModelLocationPermission();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ubicación'),
        backgroundColor: Color(0xFFC93F42),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: _mapReturn(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          modelLocationPermission.request();
          setState(() {
            print("Location activated::::: $loc");
            if (loc) {
              loc = false;
            } else {
              loc = true;
            }
          });
        },
        child: Icon(Icons.my_location),
        backgroundColor: Color(0xFFC93F42),
      ),
    );
  }

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  Widget _mapReturn() {
    if (loc) {
      return MapboxMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
            target: LatLng(37.4219999, -122.0862462), zoom: 15.0),
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
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
