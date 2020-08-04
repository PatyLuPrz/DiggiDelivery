import 'package:diggi_delivery_movil/models/theme_preferences.dart';
import 'package:diggi_delivery_movil/helpers/theme.dart';
import 'package:diggi_delivery_movil/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PerfilUsuarioPage extends StatefulWidget {
  final String nombre;

  const PerfilUsuarioPage({Key key, this.nombre}) : super(key: key);
  @override
  _PerfilUsuarioPageState createState() => _PerfilUsuarioPageState();
}

class _PerfilUsuarioPageState extends State<PerfilUsuarioPage> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        children: <Widget>[
          _userData(currentTheme),
          _modoOscuro(currentTheme),
        ],
      ),
    );
  }

  //Switch para encender o apagar el modo oscuro de la app
  _modoOscuro(ThemeProvider currentTheme) {
    return Column(
      children: <Widget>[
        Text(
          'Toca para cambiar el tema',
          style: TextStyle(
              color: currentTheme.currentThemeColorText(currentTheme)),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(Icons.wb_sunny,
                color: currentTheme.currentThemeColorText(currentTheme)),
            Switch(
                value: currentTheme.isDarkTheme(),
                onChanged: (value) {
                  //Se cambia el tema de la app con u switch
                  String newTheme =
                      value ? ThemePreference.DARK : ThemePreference.LIGHT;
                  currentTheme.setTheme = newTheme;
                }),
            Icon(Icons.brightness_2,
                color: currentTheme.currentThemeColorText(currentTheme))
          ],
        )
      ],
    );
  }

  //Container que contiene información del usuario como su foto, nombre
  _userData(ThemeProvider currentTheme) {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      height: 300.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: currentTheme.currentThemeColorContainer(currentTheme),
      ),
      child: Column(
        children: <Widget>[
          //Imagen del usuario
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 150.0,
              width: 150.0,
              padding: EdgeInsets.all(5.0),
              child: CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage(
                      'https://img.favpng.com/6/24/19/user-profile-avatar-computer-icons-png-favpng-3r2RjSZGPQVAWPw2hFcQqTv1t.jpg')),
            ),
          ),
          SizedBox(height: 30.0),
          //Nombre del usuario
          CustomText(
            text: 'Luis Norberto Paloma Rodriguez',
            color: Colors.white,
          ),
          SizedBox(height: 10.0),
          //Boton para llevar al usuario a editar sus datos
          Container(
            width: 170.0,
            child: RaisedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomText(text: 'Configuración', color: Colors.black),
                  SizedBox(width: 10.0),
                  Icon(Icons.settings, size: 20.0, color: Colors.black)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
