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
          SizedBox(height: size.height * 0.03),
          _crearEmail(),
          SizedBox(height: size.height * 0.03),
          _crearDireccion(),
          SizedBox(height: size.height * 0.03),
          _crearFoto(),
          SizedBox(height: size.height * 0.03),
          _crearNombre(),
          SizedBox(height: size.height * 0.03),
          _crearTelefono(),
          SizedBox(height: size.height * 0.03),
          _crearUsuario(),
          SizedBox(height: size.height * 0.03),
        ],
      ),
    );
  }

  Widget _crearEmail() {
    final dec = DecorationInputForm(
        textLabel: "Correo electronico", textHint: "Correo", icon: Icons.email);
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        enabled: false,
        decoration: dec.decoration(),
      ),
    );
  }

  Widget _crearDireccion() {
    final dec = DecorationInputForm(
        textLabel: "Dirección",
        textHint: "Camelia #256, 43600, Tulancingo",
        icon: Icons.map);
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.text,
        enabled: true,
        decoration: dec.decoration(),
      ),
    );
  }

  Widget _crearFoto() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 60.0),
      height: 200.0,
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Container(
            width: 100.0,
            height: 100.0,
            child: CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://img.favpng.com/6/24/19/user-profile-avatar-computer-icons-png-favpng-3r2RjSZGPQVAWPw2hFcQqTv1t.jpg')),
          ),
          SizedBox(width: 20.0),
          RaisedButton(
            onPressed: () {},
            child: Container(
              child: Text('Foto'),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            elevation: 0.0,
            color: Color(0xFFC93F42),
            textColor: Colors.white,
          )
        ],
      ),
    );
  }

  Widget _crearNombre() {
    final dec = DecorationInputForm(
        textLabel: "Nombre de usuario",
        textHint: "Juan Perez",
        icon: Icons.person);
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.text,
        enabled: true,
        decoration: dec.decoration(),
      ),
    );
  }

  Widget _crearTelefono() {
    final dec = DecorationInputForm(
        textLabel: "Telefono", textHint: "77512345678", icon: Icons.phone);
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.number,
        enabled: true,
        decoration: dec.decoration(),
      ),
    );
  }

  Widget _crearUsuario() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: RaisedButton(
        onPressed: () {},
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50.0,
          child: Text('Finalizar registro'),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 0.0,
        color: Color(0xFFC93F42),
        textColor: Colors.white,
      ),
    );
  }
}
