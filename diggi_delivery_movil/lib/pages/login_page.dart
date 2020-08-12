import 'package:diggi_delivery_movil/blocs/pages/Login/provider.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
          _loginForm(context, size),
          //_loginForm(),
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

  Widget _loginForm(BuildContext context, Size size) {
    //Formulario de inicio de sesión
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
                _crearPassword(bloc),
                SizedBox(height: 30.0),
                _crearBoton(bloc),
              ],
            ),
          ),
          _registro(size, context),
        ],
      ),
    );
  }

  //Campo para ingresar email
  _crearEmail(RegistroBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStreamlog,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(Icons.email, color: Colors.black, size: 20),
                hintText: 'correo@email.com',
                labelStyle: TextStyle(color: Colors.black),
                labelText: 'Correo electrónico',
                counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  _crearPassword(RegistroBloc bloc) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          obscureText: true,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.lock_outline, color: Colors.black),
            labelText: 'Contraseña',
          ),
        ));
  }

  _crearBoton(RegistroBloc bloc) {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
        child: Text('Iniciar sesión'),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      elevation: 0.0,
      color: Color(0xFFC93F42),
      textColor: Colors.white,
      onPressed: () {},
    );
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

  _registro(Size size, BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('¿Aun no tienes una cuenta?'),
          FlatButton(
            child: Text('Registrate aquí'),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, 'registro'),
          ),
        ],
      ),
    );
  }
}
