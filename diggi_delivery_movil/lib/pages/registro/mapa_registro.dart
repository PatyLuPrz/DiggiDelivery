import 'package:diggi_delivery_movil/models/model_location.dart';
import 'package:diggi_delivery_movil/models/model_mapbox.dart';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
// import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:permission_handler/permission_handler.dart';

class MapaRegistro extends StatefulWidget {
  final String nombre;

  const MapaRegistro({Key key, this.nombre}) : super(key: key);

  @override
  _MapaRegistroState createState() => _MapaRegistroState();
}

class _MapaRegistroState extends State<MapaRegistro>
    with WidgetsBindingObserver {
  Future<void> request() async {
    //Permite hacer la consulta hacia los permisos de ubicación
    final PermissionStatus status =
        await Permission.locationWhenInUse.request();

    print("STATUS :::::::::::::::::::::::: $status");

    switch (status) {
      case PermissionStatus.undetermined:
        break;
      case PermissionStatus.granted:
        //Deja iniciar el mapa si los permisos de ubicacón han sido otorgados
        this._goTpMap();
        break;
      case PermissionStatus.denied:
        if (Platform.isIOS) {
          this._openAppSettings();
        }
        break;
      case PermissionStatus.restricted:
        break;
      case PermissionStatus.permanentlyDenied:
        this._openAppSettings();
        break;
    }
  }

  _openAppSettings() async {
    await openAppSettings();
  }

  @override
  void initState() {
    super.initState();
    //Agrega un observador cuando la app se activa
    WidgetsBinding.instance.addObserver(this);
    print("SE ESTA EJECUTANDO XD");
    this._check();
  }

  @override
  void dispose() {
    //Remueve el observador antes de cerrar la app o la pantalla
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("ApplifecycleState :::::::::::::::: $state");
    //Obtiene el estado de la app y genera una acción si la ubicación ha sido activdadaa y la app resumida
    if (state == AppLifecycleState.resumed) {
      this._check();
    }
  }

  _check() async {
    print("ApplifecycleState :::::::::::::::: CHECKING");
    //Obtiene los permisos de ubicación y abre el mapa
    final bool hasAccess = await Permission.locationWhenInUse.isGranted;
    setState(() {
      if (hasAccess) {
        this._goTpMap();
      }
    });
  }

  _goTpMap() {
    loc = true;
  }

  bool loc = false;
  // MapasApi mapasAspi = MapasApi();
  MapboxMapController mapController;
  @override
  Widget build(BuildContext context) {
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
          setState(() {
            this.request();
            print("Location activated::::: $loc");
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
