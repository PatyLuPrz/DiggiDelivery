import 'package:diggi_delivery_movil/blocs/pages/provider.dart';
import 'package:diggi_delivery_movil/helpers/theme.dart';
import 'package:diggi_delivery_movil/pages/Restaurante/home_restaurante_page.dart';
import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';

import 'package:diggi_delivery_movil/routes.dart';
import 'package:provider/provider.dart' as prov;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final prefs = new PreferenciasUsuario();
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
    return Provider(
      child: prov.ChangeNotifierProvider.value(
        value: themeChangeProvider,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          initialRoute: 'login',
          routes: {
            'login': (BuildContext context) => LoginPage(),
            'registro': (BuildContext context) => RegistroPage(),
            'registroBienvenida': (BuildContext context) => BienvenidaPage(),
            'cliente': (BuildContext context) => ClienteRegisgtro(),
            'local': (BuildContext context) => LocalRegisgtro(),
            'restaurante': (BuildContext context) => RestauranteRegistro(),
            'registroMapa': (BuildContext context) => MapaRegistro(),
            'homepagecliente': (BuildContext context) => HomePage(),
            'homepagelocal': (BuildContext context) => HomePageLocal(),
            'homePageRestaurante': (BuildContext context) => HomePageRestaurante(),
            'productoLocal': (BuildContext context) => ProductoLocal(),
          },
        ),
      ),
    );
  }
}
