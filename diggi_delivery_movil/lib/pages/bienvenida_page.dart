import 'package:flutter/material.dart';

class BienvenidaPage extends StatelessWidget {
  const BienvenidaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          child: Text("Bienvenido"),
        ),
      ),
    );
  }
}