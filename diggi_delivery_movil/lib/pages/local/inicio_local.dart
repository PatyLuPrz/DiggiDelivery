import 'package:flutter/material.dart';

class InicioLocal extends StatefulWidget {
  const InicioLocal({Key key}) : super(key: key);

  @override
  _InicioLocalState createState() => _InicioLocalState();
}

class _InicioLocalState extends State<InicioLocal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFC93F42),
          title: Center(child: Text('Establecimiento')),
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
