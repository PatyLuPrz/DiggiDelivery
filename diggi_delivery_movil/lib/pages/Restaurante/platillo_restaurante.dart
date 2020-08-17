import 'dart:io';

import 'package:diggi_delivery_movil/widgets/input_decoration.dart';
import 'package:flutter/material.dart';

class PlatilloRestaurante extends StatefulWidget {
  @override
  _PlatilloRestauranteState createState() => _PlatilloRestauranteState();
}

class _PlatilloRestauranteState extends State<PlatilloRestaurante> {
  //Key de los widget para evaluar las acciones a realizar
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  File foto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFC93F42),
        title: Text('Platillo'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.photo_size_select_actual), onPressed: () {}),
          IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    "Introducir la información necesaria para agregar un nuevo producto",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.0),
                  _crearNombre(),
                  SizedBox(height: 15.0),
                  _crearMarca(),
                  SizedBox(height: 15.0),
                  _crearPresentacion(),
                  SizedBox(height: 15.0),
                  _crearCantidad(),
                  SizedBox(height: 15.0),
                  _crearPrecio(),
                  SizedBox(height: 15.0),
                  _crearBoton(),
                  SizedBox(height: 15.0),
                ],
              )),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    final dec = DecorationInputForm(
        textLabel: "Nombre de producto",
        textHint: "Lapicero",
        icon: Icons.shop);
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.text,
        enabled: true,
        decoration: dec.decoration(),
      ),
    );
  }

  Widget _crearMarca() {
    final dec = DecorationInputForm(
        textLabel: "Marca de producto", textHint: "Bic", icon: Icons.copyright);
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.text,
        enabled: true,
        decoration: dec.decoration(),
      ),
    );
  }

  Widget _crearPresentacion() {
    final dec = DecorationInputForm(
        textLabel: "Presentación", textHint: "10g", icon: Icons.view_list);
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.text,
        enabled: true,
        decoration: dec.decoration(),
      ),
    );
  }

  Widget _crearCantidad() {
    final dec = DecorationInputForm(
        textLabel: "Cantidad disponible", textHint: "10", icon: Icons.storage);
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: dec.decoration(),
    );
  }

  Widget _crearPrecio() {
    final dec = DecorationInputForm(
        textLabel: "Precio de producto",
        textHint: "100.0",
        icon: Icons.attach_money);
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: dec.decoration(),
    );
  }

  Widget _crearBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Color(0xFFC93F42),
      textColor: Colors.white,
      label: Text('Guardar producto'),
      icon: Icon(Icons.save),
      onPressed: () {},
    );
  }
}
