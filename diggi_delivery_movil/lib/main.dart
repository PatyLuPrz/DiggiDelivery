import 'package:diggi_delivery_movil/pages/HomePage.dart';
import 'package:diggi_delivery_movil/pages/LoginPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage(),
      },
      theme: ThemeData(primaryColor: Color.fromRGBO(202, 63, 67, 1.0)),
    );
  }
}
