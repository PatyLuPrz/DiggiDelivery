import 'package:flutter/material.dart';

class MapaClientes extends StatefulWidget {
  final String nombre;

  const MapaClientes({Key key, this.nombre}) : super(key: key);

  @override
  _MapaClientesState createState() => _MapaClientesState();
}

class _MapaClientesState extends State<MapaClientes> {
  @override
  Widget build(BuildContext context) {
    final MapCont
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/img/mapa.jpg'), fit: BoxFit.cover),
      ),
    );
  }
}
