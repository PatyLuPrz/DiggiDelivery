import 'package:flutter/material.dart';

class MapaClientes extends StatelessWidget {
  final String nombre;

  const MapaClientes({Key key, this.nombre}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/img/mapa.jpg'), fit: BoxFit.cover),
      ),
    );
  }
}
