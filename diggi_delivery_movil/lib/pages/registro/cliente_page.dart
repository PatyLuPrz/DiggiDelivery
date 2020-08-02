import 'package:diggi_delivery_movil/widgets/input_decoration.dart';
import 'package:flutter/material.dart';

class ClienteRegisgtro extends StatefulWidget {
  ClienteRegisgtro({Key key}) : super(key: key);

  @override
  _ClienteRegisgtroState createState() => _ClienteRegisgtroState();
}

class _ClienteRegisgtroState extends State<ClienteRegisgtro> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Cliente"),
            backgroundColor: Color(0xFFC93F42),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: _formCliente(context, size),
          )),
    );
  }

  _formCliente(BuildContext context, Size size) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Text(
            "Para formar parte de Diggi Delivery como cliente, ingresa tu información personal:",
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          _crearEmail(),
          _crearDireccion(),
          _crearFoto(),
          _crearNombre(),
          _crearTelefono(),
        ],
      ),
    );
  }

  Widget _crearEmail() {
    final dec = DecorationInputForm(text: "email@correo.com");
    return Container(
      child: TextFormField(
        enabled: false,
        decoration: dec.decoration(),
      ),
    );
  }

  Widget _crearDireccion() {
    final dec = DecorationInputForm(text: "email@correo.com");
    return Container(
      child: TextFormField(
        enabled: false,
        decoration: dec.decoration(),
      ),
    );
  }

  Widget _crearFoto() {
    return Container();
  }

  Widget _crearNombre() {
    final dec = DecorationInputForm(text: "email@correo.com");
    return Container(
      child: TextFormField(
        enabled: false,
        decoration: dec.decoration(),
      ),
    );
  }

  Widget _crearTelefono() {
    final dec = DecorationInputForm(text: "email@correo.com");
    return Container(
      child: TextFormField(
        t
        enabled: false,
        decoration: dec.decoration(),
      ),
    );
  }
}
