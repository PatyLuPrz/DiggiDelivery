import 'package:diggi_delivery_movil/routes.dart';
import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart';
import 'package:diggi_delivery_movil/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class PerfilUsuarioPage extends StatefulWidget {
  static final String routeName = 'home';
  final String nombre;

  const PerfilUsuarioPage({Key key, this.nombre}) : super(key: key);
  @override
  _PerfilUsuarioPageState createState() => _PerfilUsuarioPageState();
}

class _PerfilUsuarioPageState extends State<PerfilUsuarioPage> {
  Size size;
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    // final currentTheme = Provider.of<ThemeProvider>(context);
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[
          _userData(),
          // _modoOscuro(currentTheme),
        ],
      ),
    );
  }

  // //Switch para encender o apagar el modo oscuro de la app
  // _modoOscuro(ThemeProvider currentTheme) {
  //   return Column(
  //     children: <Widget>[
  //       Text(
  //         'Toca para cambiar el tema',
  //         style: TextStyle(
  //             color: currentTheme.currentThemeColorText(currentTheme)),
  //       ),
  //       SizedBox(
  //         height: size.height * 0.02,
  //       ),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         children: <Widget>[
  //           Icon(Icons.wb_sunny,
  //               color: currentTheme.currentThemeColorText(currentTheme)),
  //           Switch(
  //               value: currentTheme.isDarkTheme(),
  //               onChanged: (value) {
  //                 //Se cambia el tema de la app con u switch
  //                 String newTheme =
  //                     value ? ThemePreference.DARK : ThemePreference.LIGHT;
  //                 currentTheme.setTheme = newTheme;
  //               }),
  //           Icon(Icons.brightness_2,
  //               color: currentTheme.currentThemeColorText(currentTheme))
  //         ],
  //       )
  //     ],
  //   );
  // }

  //Container que contiene información del usuario como su foto, nombre
  _userData() {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      height: size.height * 0.8,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.black38,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //Imagen del usuario
            _imagenAvatar(),
            SizedBox(height: size.height * 0.04),
            //Nombre del usuario
            CustomText(
              text: prefs.email,
              color: Colors.white,
            ),
            SizedBox(height: size.height * 0.02),
            //Boton para llevar al usuario a editar sus datos
            _configuracionBoton(),
            //Boton para cerrar sesión
            _cerrarSesion(),
          ],
        ),
      ),
    );
  }

  Widget _configuracionBoton() {
    return Container(
      width: size.width * 0.5,
      child: RaisedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomText(text: 'Configuración', color: Colors.black),
            SizedBox(width: size.width * 0.03),
            Icon(Icons.settings, size: 20.0, color: Colors.black)
          ],
        ),
      ),
    );
  }

  Widget _imagenAvatar() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: size.height * 0.300,
        width: size.width * 0.600,
        padding: EdgeInsets.all(5.0),
        child: CircleAvatar(
          radius: 25.0,
          backgroundImage: NetworkImage(prefs.fotoURL),
          onBackgroundImageError: (exception, stackTrace) {
            AssetImage('assets/img/original.gif');
          },
        ),
      ),
    );
  }

  Widget _cerrarSesion() {
    return Container(
      width: size.width * 0.5,
      child: RaisedButton(
        onPressed: () {
          prefs.clear();
          Navigator.pushReplacementNamed(context, LoginPage.routeName);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomText(text: 'Cerrar sesión', color: Colors.black),
            SizedBox(width: size.width * 0.03),
            Icon(Icons.exit_to_app, size: 20.0, color: Colors.black)
          ],
        ),
      ),
    );
  }
}
