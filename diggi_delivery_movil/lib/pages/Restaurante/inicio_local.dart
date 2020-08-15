import 'package:flutter/material.dart';

class InicioRestaurante extends StatefulWidget {
  const InicioRestaurante({Key key}) : super(key: key);

  @override
  _InicioRestauranteState createState() => _InicioRestauranteState();
}

class _InicioRestauranteState extends State<InicioRestaurante> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFC93F42),
          title: Center(child: Text('Restaurante')),
        ),
        body: _crearListado(),
        floatingActionButton: _crearBoton(context),
      ),
    );
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, 'productoLocal')
          .then((value) => setState(() {})),
      backgroundColor: Color(0xFFC93F42),
      child: Icon(Icons.add),
    );
  }

  Widget _crearListado() {
    return ListView(
      children: <Widget>[],
    );
  }
}
