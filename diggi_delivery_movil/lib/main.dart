import 'package:diggi_delivery_movil/blocs/pages/provider.dart';
import 'package:diggi_delivery_movil/helpers/theme.dart';

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
          initialRoute: prefs.ultimaPagina,
          routes: {
            LoginPage.routeName: (BuildContext context) => LoginPage(),
            RegistroPage.routeName: (BuildContext context) => RegistroPage(),
            BienvenidaPage.routeName: (BuildContext context) =>
                BienvenidaPage(),
            ClienteRegisgtro.routeName: (BuildContext context) =>
                ClienteRegisgtro(),
            LocalRegisgtro.routeName: (BuildContext context) =>
                LocalRegisgtro(),
            RestauranteRegistro.routeName: (BuildContext context) =>
                RestauranteRegistro(),
            MapaRegistro.routeName: (BuildContext context) => MapaRegistro(),
            HomePage.routeName: (BuildContext context) => HomePage(),
            HomePageLocal.routeName: (BuildContext context) => HomePageLocal(),
            HomePageRestaurante.routeName: (BuildContext context) =>
                HomePageRestaurante(),
            ProductoLocal.routeName: (BuildContext context) => ProductoLocal(),
            PlatilloRestaurante.routeName: (BuildContext context) =>
                PlatilloRestaurante(),
          },
        ),
      ),
    );
  }
}
