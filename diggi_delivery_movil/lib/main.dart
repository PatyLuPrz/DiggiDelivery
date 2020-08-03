import 'dart:developer';

import 'package:diggi_delivery_movil/pages/registro/bienvenida_page.dart';
import 'package:diggi_delivery_movil/pages/clientes/home_cliente_page.dart';
import 'package:diggi_delivery_movil/pages/login_page.dart';
import 'package:diggi_delivery_movil/pages/registro/cliente_page.dart';
import 'package:diggi_delivery_movil/pages/registro/local_page.dart';
import 'package:diggi_delivery_movil/pages/registro/mapa_registro.dart';
import 'package:diggi_delivery_movil/pages/registro/registro_page.dart';
import 'package:diggi_delivery_movil/pages/registro/restaurante_page.dart';
import 'package:diggi_delivery_movil/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeChangeProvider = new ThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.setTheme =
        await themeChangeProvider.themePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: themeChangeProvider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'homepagecliente',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'registro': (BuildContext context) => RegistroPage(),
          'registroBienvenida': (BuildContext context) => BienvenidaPage(),
          'cliente': (BuildContext context) => ClienteRegisgtro(),
          'local': (BuildContext context) => LocalRegisgtro(),
          'restaurante': (BuildContext context) => RestauranteRegistro(),
          'registroMapa': (BuildContext context) => MapaRegistro(),
          'homepagecliente': (BuildContext context) => HomePage(),
        },
      ),
    );
  }
}
