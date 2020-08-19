import 'dart:io';

import 'package:diggi_delivery_movil/blocs/archivos_bloc.dart';
import 'package:diggi_delivery_movil/blocs/pages/provider.dart';
import 'package:diggi_delivery_movil/models/cliente_model.dart';
import 'package:diggi_delivery_movil/models/model_usuarios.dart';
import 'package:diggi_delivery_movil/routes.dart';
import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart';
import 'package:diggi_delivery_movil/widgets/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:diggi_delivery_movil/utils/utils.dart' as utils;

class ClienteRegisgtro extends StatefulWidget {
  static final String routeName = 'cliente';

  ClienteRegisgtro({Key key}) : super(key: key);

  @override
  _ClienteRegisgtroState createState() => _ClienteRegisgtroState();
}

class _ClienteRegisgtroState extends State<ClienteRegisgtro>
    with WidgetsBindingObserver {
  RegistroBloc _registroBloc = RegistroBloc();
  ClienteModel _clienteModel = new ClienteModel();
  ArchivosBloc _archivosModel = new ArchivosBloc();
  ModelUsuarios _modelUsuarios = new ModelUsuarios();
  UsuarioProvider _usuarioProvider = new UsuarioProvider();

  final picker = ImagePicker();
  final prefs = new PreferenciasUsuario();
  File foto;
  Path path;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _guardando = false;

  @override
  void initState() {
    super.initState();
    //Agrega un observador cuando la app se activa
    WidgetsBinding.instance.addObserver(this);
    prefs.foto = '';
  }

  @override
  void dispose() {
    //Remueve el observador antes de cerrar la app o la pantalla
    WidgetsBinding.instance.removeObserver(this);
    //Deja de escuchar los cambios de ubicación
    prefs.latitud = '';
    prefs.logitud = '';
    prefs.foto = '';
    super.dispose();
  }

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
        ),
      ),
    );
  }

  _formCliente(BuildContext context, Size size) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Text(
              "Para formar parte de Diggi Delivery como cliente, ingresa tu información personal:",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * 0.03),
            _crearEmail(),
            SizedBox(height: size.height * 0.03),
            _crearPassword(),
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
      ),
    );
  }

  Widget _crearEmail() {
    final dec = DecorationInputForm(
        textLabel: "Corrreo electronico",
        textHint: "Correo",
        icon: Icons.email);
    return Container(
      child: TextFormField(
        initialValue: prefs.email,
        keyboardType: TextInputType.emailAddress,
        enabled: false,
        decoration: dec.decoration(),
        onSaved: (value) => _clienteModel.email = value,
        validator: (value) {
          if (value.isEmpty) {
            return 'Ingrese el correo valido';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _crearPassword() {
    final dec = DecorationInputForm(
      textLabel: 'Escribe una contraseña',
      textHint: "Contraseña",
      icon: Icons.lock_outline,
    );
    return Container(
      child: TextFormField(
          obscureText: true,
          keyboardType: TextInputType.emailAddress,
          decoration: dec.decoration(),
          onSaved: (value) => _clienteModel.pass = value,
          validator: (value) {
            if (value.length <= 6) {
              return 'Ingresar más de 6 caracteres';
            } else {
              return null;
            }
          }),
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
        onSaved: (value) => _clienteModel.direccion = value,
        validator: (value) {
          if (value.isEmpty) {
            return 'Ingrese su dirección';
          } else {
            return null;
          }
        },
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
        foto = null;
        foto = File(pickedFile.path);
      });
    }
  }

  Widget _crearNombre() {
    final dec = DecorationInputForm(
        textLabel: "Nombre del cliente",
        textHint: "Juan Perez",
        icon: Icons.person);
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.text,
        enabled: true,
        decoration: dec.decoration(),
        onSaved: (value) => _clienteModel.nombre = value,
        validator: (value) {
          print("NOMBRE :::: $value");
          if (value.isEmpty) {
            return 'Ingrese el nombre del usuario';
          } else {
            return null;
          }
        },
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
        keyboardType: TextInputType.phone,
        maxLength: 10,
        enableInteractiveSelection: false,
        onSaved: (value) => _clienteModel.telefono = value,
        validator: (value) {
          print("Telefono :::: $value");
          if (!utils.isNumeric(value) || value.contains(".") || value.isEmpty) {
            return 'Ingrese un número de 10 digitos';
          } else {
            return null;
          }
        },
        enabled: true,
        decoration: dec.decoration(),
      ),
    );
  }

  Widget _crearUsuario() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: RaisedButton(
        onPressed: (_guardando) ? null : _submit,
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

  void _submit() async {
    if (!formKey.currentState.validate() || foto == null) return;

    formKey.currentState.save();
    // Valiar si el usuario ya existe
    final info = await _usuarioProvider.nuevoUsuario(
        _clienteModel.email, _clienteModel.pass);
    if (info['ok']) {
      _clienteModel.foto = await _archivosModel.subirFoto(foto);
      setState(() {
        _guardando = true;
        print(_clienteModel.direccion);
        print(_clienteModel.email);
        print(_clienteModel.foto);
        print(_clienteModel.nombre);
        print(_clienteModel.telefono);

        _clienteModel.latitud = prefs.latitud;
        _clienteModel.longitud = prefs.logitud;
        _modelUsuarios.email = _clienteModel.email;
        _modelUsuarios.nivel = '2';

        //Agrega los registros a la tabla de usuario y locales
        _registroBloc.agregarNuevoCliente(_clienteModel);
        _registroBloc.agregarNuevoUsuario(_modelUsuarios);

        prefs.clear();
        prefs.email = _clienteModel.email;
        prefs.nivelUsuario = _modelUsuarios.nivel;
        prefs.nombre = _clienteModel.nombre;
        prefs.fotoURL = _clienteModel.foto;
      });
      Navigator.pushReplacementNamed(context, HomePage.routeName);
      _guardando = false;
    } else {
      utils.mostrarAlerta(context, info['mensaje']);
    }
  }

  // void mostrarSnackbar(String mensaje) {
  //   final snackbar = SnackBar(
  //     content: Text(mensaje),
  //     duration: Duration(milliseconds: 1500),
  //   );
  //   scaffoldKey.currentState.showSnackBar(snackbar);
  // }
}
