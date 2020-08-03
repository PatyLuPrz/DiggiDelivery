import 'package:diggi_delivery_movil/widgets/input_decoration.dart';
import 'package:flutter/material.dart';

class LocalRegisgtro extends StatefulWidget {
  LocalRegisgtro({Key key}) : super(key: key);

  @override
  _LocalRegisgtroState createState() => _LocalRegisgtroState();
}

class _LocalRegisgtroState extends State<LocalRegisgtro> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Local"),
            backgroundColor: Color(0xFFC93F42),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: _formLocal(context, size),
          )),
    );
  }

  _formLocal(BuildContext context, Size size) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Text(
            "Para formar parte de Diggi Delivery como Local, ingresa la información de tu establecimiento:",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.height * 0.03),
          _crearEmail(),
          SizedBox(height: size.height * 0.03),
          _ingresarUbicacion(),
          SizedBox(height: size.height * 0.03),
          _crearDireccion(),
          SizedBox(height: size.height * 0.03),
          _crearFoto(size),
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
        textLabel: "Dirección del local",
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

  Widget _crearFoto(Size size) {
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
              width: size.width * 0.10,
              height: size.width * 0.10,
              child: RichText(
                text: TextSpan(children: [
                  WidgetSpan(
                      child: SizedBox(
                    height: 0.4,
                  )),
                  WidgetSpan(
                      child: Center(
                    child: Text("Foto"),
                  )),
                  WidgetSpan(
                      child: Center(child: Icon(Icons.file_upload, size: 15.0)))
                ]),
              ),
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
        textLabel: "Nombre del Local",
        textHint: "Pizzas Perez",
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
        textLabel: "Número de teléfono",
        textHint: "77512345678",
        icon: Icons.phone);
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

  Widget _ingresarUbicacion() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: RaisedButton(
        onPressed: () => Navigator.pushNamed(context, "registroMapa"),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50.0,
          child: RichText(
            text: TextSpan(children: [
              TextSpan(text: "Agregar ubicación"),
              WidgetSpan(child: SizedBox(width: 50.0)),
              WidgetSpan(child: Icon(Icons.chevron_right, size: 15.0))
            ]),
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 0.0,
        color: Color(0xFFC93F42),
        textColor: Colors.white,
      ),
    );
  }
}