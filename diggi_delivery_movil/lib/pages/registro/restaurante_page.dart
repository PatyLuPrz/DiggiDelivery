import 'package:flutter/material.dart';

class RestauranteRegistro extends StatefulWidget {
  RestauranteRegistro({Key key}) : super(key: key);

  @override
  _RestauranteRegistroState createState() => _RestauranteRegistroState();
}

class _RestauranteRegistroState extends State<RestauranteRegistro> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(
            child: Container(
          child: Text("Restaurante"),
        )),
      ),
    );
  }
}
