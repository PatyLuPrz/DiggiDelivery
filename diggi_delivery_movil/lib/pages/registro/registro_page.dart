import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/blocs/pages/Login/provider.dart';
import 'package:diggi_delivery_movil/providers/usuario_provider.dart';
import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart';
import 'package:diggi_delivery_movil/utils/utils.dart';
import 'package:flutter/material.dart';

class RegistroPage extends StatefulWidget {
  RegistroPage({Key key}) : super(key: key);

  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final prefs = new PreferenciasUsuario();
  final usuarioProvider = new UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
          _registerForm(context),
        ],
      ),
    );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        logo(size),
      ],
    );
  }

  Widget _registerForm(BuildContext context) {
    final usuarioProvider = new UsuarioProvider();
    final size = MediaQuery.of(context).size;
    final bloc = Provider.of(context);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
              child: Container(
            height: 180.0,
          )),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              children: <Widget>[
                _crearEmail(bloc),
                SizedBox(height: 30.0),
                SizedBox(height: 30.0),
                _crearBoton(bloc),
              ],
            ),
          ),
          _login(size, context),
        ],
      ),
    );
  }

  Widget _crearEmail(RegistroBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(Icons.email, color: Colors.black, size: 20),
                hintText: 'correo@email.com',
                labelText: 'Correo electrónico',
                counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: (value) {
              bloc.changeEmail(value);
              prefs.email = value;
            },
          ),
        );
      },
    );
  }

  Widget _crearBoton(RegistroBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Registrar'),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          elevation: 0.0,
          color: Color(0xFFC93F42),
          textColor: Colors.white,
          onPressed: snapshot.hasData ? () => _registrar(bloc, context) : null,
        );
      },
    );
  }

  _registrar(RegistroBloc bloc, BuildContext context) async {
    print('=============================================');
    print('Email: ${bloc.emailStream}');
    print('Email 2: ${prefs.email}');
    print('=============================================');
    var info = await usuarioProvider.getEmail(prefs.email);
    if (info['ok']) {
      mostrarAlerta(context, info['mensaje']);
    } else {
      Navigator.pushReplacementNamed(context, 'registroBienvenida');
    }
  }

  logo(Size size) {
    //Logo de la aplicación
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //Logo
          Image.asset(
            'assets/img/logo.png',
            width: size.width * 0.70,
            height: size.height * 0.10,
            alignment: Alignment.center,
          ),
          SizedBox(
            height: size.height * 0.01,
            width: size.width * 0.1,
          ),
        ],
      ),
    );
  }

  _login(Size size, BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('¿Ya tienes una cuenta?'),
          FlatButton(
            child: Text('Inicia sesión aquí'),
            onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
          ),
        ],
      ),
    );
  }
}
