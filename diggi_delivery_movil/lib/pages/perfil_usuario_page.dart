import 'package:diggi_delivery_movil/models/theme_preferences.dart';
import 'package:diggi_delivery_movil/providers/theme.dart';
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
      child: Stack(
        children: <Widget>[
          CircleAvatar(
              radius: 55.0,
              backgroundColor: Color(0xffFDCF09),
              child: CircleAvatar(
                
              ))
        ],
      ),
    );
  }
}
