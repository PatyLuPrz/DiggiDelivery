import 'package:diggi_delivery_movil/widgets/custom_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../blocs/pages/registro/bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class MapaRegistro extends StatefulWidget {
  final String nombre;

  const MapaRegistro({Key key, this.nombre}) : super(key: key);

  @override
  _MapaRegistroState createState() => _MapaRegistroState();
}

class _MapaRegistroState extends State<MapaRegistro>
    with WidgetsBindingObserver {
  //Se importa la instancia de BLoC de los mapas de registro (blocs/pages/registro/bloc)
  final MapaRegistroBloc _mapaRegistroBloc = MapaRegistroBloc();

  bool loc = false;
  bool hasAccessDenied;
  var denied;

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
        this._openAppSettings();

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
    this._check();
  }

  @override
  void dispose() {
    //Remueve el observador antes de cerrar la app o la pantalla
    WidgetsBinding.instance.removeObserver(this);
    //Deja de escuchar los cambios de ubicación
    _mapaRegistroBloc.close();
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
    hasAccessDenied = await Permission.locationWhenInUse.isDenied;
    denied = GeolocationStatus.denied;
    print(denied);
    print(hasAccessDenied);
    setState(() {
      if (hasAccess) {
        this._goTpMap();
      }
    });
  }

  _goTpMap() {
    loc = true;
  }

  @override
  Widget build(BuildContext context) {
    //Todos los Widgets hijos del BLoC provider podran hacer uso de la información del BloC de ubicación
    return _mapBuilder();
  }

  Widget _mapReturn(MapaRegistroState state) {
    final CameraPosition initalPosition =
        CameraPosition(target: state.myLocation, zoom: 15);
    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        this._mapaRegistroBloc.setMapController(controller);
      },
      zoomGesturesEnabled: false,
      compassEnabled: true,
      tiltGesturesEnabled: true,
      onTap: (LatLng coordinates) {
        print("AddMarker:::: $coordinates");
      },
      initialCameraPosition: initalPosition,
    );
  }

  Widget _circularProgressIndi() {
    return Center(
        child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFC93F42)),
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            child: CustomText(text: "Permitir ubicación"),
            onPressed: () {
              // Add your onPressed code here!
              setState(() {
                this.request();
              });
            },
          ),
        ],
      ),
    ));
  }

  Widget _mapBuilder() {
    return BlocProvider.value(
      value: this._mapaRegistroBloc,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Ubicación'),
          backgroundColor: Color(0xFFC93F42),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: BlocBuilder<MapaRegistroBloc, MapaRegistroState>(
            builder: (_, MapaRegistroState state) {
              if (state.loading) {
                print(denied);
                return _circularProgressIndi();
              }
              return _mapReturn(state);
            },
          ),
        ),
      ),
    );
  }
}
