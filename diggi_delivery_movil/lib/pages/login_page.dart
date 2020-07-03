import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondo(context),
          //_loginForm(),
        ],
      ),
    );
  }

  _fondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoRojo = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(49, 49, 49, 0.5),
        Color.fromRGBO(255,255, 255, 0),
        Color.fromRGBO(202, 63, 67, 0.5),
      ])),
    );

    final circulo = Container(
       
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(202, 63, 67, 0.05)),
    );
    final logo = Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //Logo
          Image.asset(
            'assets/img/log.png',
            width: 200.0,
            height: 200.0,
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 100.0,
            width: 100.0,
          ),
          Text('Diggi Delivery',
              style: TextStyle(color: Colors.white, fontSize: 25.0))
        ],
      ),
    );
    return Stack(
      children: <Widget>[
        fondoRojo,
        Positioned(
          child: circulo,
          top: 90.0,
          left: 30.0,
        ),
        Positioned(
          child: circulo,
          top: -40.0,
          right: -30.0,
        ),
        Positioned(
          child: circulo,
          bottom: -50.0,
          right: -10.0,
        ),
        Positioned(
          child: circulo,
          bottom: 120.0,
          right: 20.0,
        ),
        Positioned(
          child: circulo,
          bottom: -50.0,
          left: -20.0,
        ),
        logo,
      ],
    );
  }

}
