import 'dart:io';

import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart';
import 'package:diggi_delivery_movil/widgets/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LocalRegisgtro extends StatefulWidget {
  LocalRegisgtro({Key key}) : super(key: key);

  @override
  _LocalRegisgtroState createState() => _LocalRegisgtroState();
}

class _LocalRegisgtroState extends State<LocalRegisgtro> {
  final picker = ImagePicker();
  final prefs = new PreferenciasUsuario();
  File foto;
  Path path;

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
        onPressed: () =>
            // Navigator.pushReplacementNamed(context, 'homepagelocal'),
            print("PREFERENCIAS DE USUARIO :::: ${prefs.latitud} - ${prefs.logitud}"),
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
      width: double.infinity,
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

  Widget _crearFoto(Size size) {
    return Container(
      height: size.width * 0.72,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
            width: size.width * 0.5,
            height: size.height * 0.25,
            child: CircleAvatar(
                radius: 25.0,
                backgroundImage:
                    AssetImage(foto?.path ?? 'assets/img/no-image.png')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton.icon(
                  icon: Icon(Icons.photo_size_select_actual),
                  label: Text("Elegir imagen"),
                  onPressed: _seleccionarFoto),
              SizedBox(
                width: size.width * 0.05,
              ),
              RaisedButton.icon(
                icon: Icon(Icons.camera_alt),
                onPressed: _tomarFoto,
                label: Text("Tomar foto"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _seleccionarFoto() async {
    _procesarImagen(ImageSource.gallery);
  }

  void _tomarFoto() async {
    _procesarImagen(ImageSource.camera);
  }

  _procesarImagen(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    print(pickedFile);
    if (pickedFile != null) {
      setState(() {
        foto = File(pickedFile.path);
      });
    }
  }
}
