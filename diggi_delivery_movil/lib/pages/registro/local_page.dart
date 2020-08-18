import 'dart:io';

import 'package:diggi_delivery_movil/blocs/archivos_bloc.dart';
import 'package:diggi_delivery_movil/blocs/pages/provider.dart';
import 'package:diggi_delivery_movil/models/locales_model.dart';
import 'package:diggi_delivery_movil/models/model_usuarios.dart';
import 'package:diggi_delivery_movil/routes.dart';
import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart';
import 'package:diggi_delivery_movil/widgets/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:diggi_delivery_movil/utils/utils.dart' as utils;

class LocalRegisgtro extends StatefulWidget {
  static final String routeName = 'local';

  LocalRegisgtro({Key key}) : super(key: key);

  @override
  _LocalRegisgtroState createState() => _LocalRegisgtroState();
}

class _LocalRegisgtroState extends State<LocalRegisgtro>
    with WidgetsBindingObserver {
  RegistroBloc registroBloc = RegistroBloc();
  RegistroLocalModel registroLocalModel = new RegistroLocalModel();
  ArchivosBloc archivosModel = new ArchivosBloc();
  ModelUsuarios modelUsuarios = new ModelUsuarios();
  UsuarioProvider usuarioProvider = new UsuarioProvider();
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
          key: scaffoldKey,
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
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Text(
              "Para formar parte de Diggi Delivery como Local, ingresa la información de tu establecimiento:",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * 0.03),
            _crearEmail(),
            SizedBox(height: size.height * 0.03),
            _crearPassword(),
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
        onSaved: (value) => registroLocalModel.email = value,
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
          onSaved: (value) => registroLocalModel.pass = value,
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
        textLabel: "Dirección del local",
        textHint: "Camelia #256, 43600, Tulancingo",
        icon: Icons.map);
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.text,
        enabled: true,
        decoration: dec.decoration(),
        onSaved: (value) => registroLocalModel.direccion = value,
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

  Widget _crearNombre() {
    final dec = DecorationInputForm(
        textLabel: "Nombre del Local",
        textHint: "Papelería Perez",
        icon: Icons.person);
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.text,
        enabled: true,
        decoration: dec.decoration(),
        onSaved: (value) => registroLocalModel.nombre = value,
        validator: (value) {
          print("NOMBRE :::: $value");
          if (value.isEmpty) {
            return 'Ingrese el nombre del establecimiento';
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
        onSaved: (value) => registroLocalModel.telefono = int.parse(value),
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
    //Valiar si el usuario ya existe

    if (!formKey.currentState.validate() ||
        prefs.latitud == '' ||
        prefs.logitud == '' ||
        foto == null) return;

    formKey.currentState.save();

    final info = await usuarioProvider.nuevoUsuario(
        registroLocalModel.email, registroLocalModel.pass);
    if (info['ok']) {
      registroLocalModel.foto = await archivosModel.subirFoto(foto);
      setState(() {
        _guardando = true;
        registroLocalModel.latitud = prefs.latitud;
        registroLocalModel.longitud = prefs.logitud;
        modelUsuarios.email = registroLocalModel.email;
        modelUsuarios.nivel = '1';

        //Agrega los registros a la tabla de usuario y locales
        registroBloc.agregarNuevoLocal(registroLocalModel);
        registroBloc.agregarNuevoUsuario(modelUsuarios);

        prefs.clear();
        prefs.email = registroLocalModel.email;
      });
      Navigator.pushReplacementNamed(context, HomePageLocal.routeName);
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
