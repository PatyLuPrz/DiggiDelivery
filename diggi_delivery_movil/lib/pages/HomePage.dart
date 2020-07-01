import 'package:diggi_delivery_movil/helpers/style.dart';
import 'package:diggi_delivery_movil/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.5,
        title: Align(
          alignment: Alignment.center,
          child: CustomText(
            text: 'Diggi Delivery',
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: _inicioCliente(),
      bottomNavigationBar: _bottomNavigationBarCliente(),
    );
  }

  Widget _inicioCliente() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/img/fondo.jpg'), fit: BoxFit.cover),
        // color: Colors.white,
        // borderRadius: BorderRadius.only(
        //   bottomRight: Radius.circular(20),
        //   bottomLeft: Radius.circular(20),
        // ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 10),
        child: Column(
          children: <Widget>[
            //Barra de busqueda
            _barraDeBusqueda(),
            _popularesEstablecimientos(),
            _popularesRestaurantes(),
            _categorias(),
          ],
        ),
      ),
    );
  }

  Widget _barraDeBusqueda() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: Icon(
          Icons.search,
          color: Colors.red,
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: "Encuentra un establecimiento",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _popularesEstablecimientos() {
    return Container();
  }

  Widget _popularesRestaurantes() {
    return Container();
  }

  Widget _categorias() {
    return Container();
  }

  _bottomNavigationBarCliente() {}
}
