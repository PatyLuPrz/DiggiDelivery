import 'dart:io';

import 'package:diggi_delivery_movil/widgets/input_decoration.dart';
import 'package:flutter/material.dart';

class PlatilloRestaurante extends StatefulWidget {
  static final routeName = "platilloRestaurante";
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
                  _crearDescripcion(),
                  SizedBox(height: 15.0),
                  _ingredientesExtra(),
                  SizedBox(height: 15.0),
                  _crearPrecio(),
                  SizedBox(height: 15.0),
                  _tiempoDePreparacion(),
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
        textLabel: "Nombre del platillo",
        textHint: "Pizza hawuaiana",
        icon: Icons.fastfood);
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.text,
        enabled: true,
        decoration: dec.decoration(),
      ),
    );
  }

  Widget _crearDescripcion() {
    final dec = DecorationInputForm(
        textLabel: "Descripción",
        textHint: "Pizza hawuaiana con queso...",
        icon: Icons.copyright);
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.text,
        enabled: true,
        decoration: dec.decoration(),
      ),
    );
  }

  Widget _ingredientesExtra() {
    final dec = DecorationInputForm(
        textLabel: "Ingredientes extra",
        textHint: "Extra queso, extra piña...",
        icon: Icons.view_list);
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.text,
        enabled: true,
        decoration: dec.decoration(),
      ),
    );
  }

  Widget _crearPrecio() {
    final dec = DecorationInputForm(
        textLabel: "Precio de platillo",
        textHint: "100.0",
        icon: Icons.attach_money);
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: dec.decoration(),
    );
  }

  Widget _tiempoDePreparacion() {
    final dec = DecorationInputForm(
        textLabel: "Tiempo de preparación", textHint: "30 minutos", icon: Icons.storage);
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
      label: Text('Guardar platillo'),
      icon: Icon(Icons.save),
      onPressed: () {},
    );
  }
}
