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
          Text(
            'Toca para cambiar el tema',
            style: TextStyle(color: currentThemeColor(currentTheme)),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(Icons.wb_sunny, color: currentThemeColor(currentTheme)),
              Switch(
                  value: currentTheme.isDarkTheme(),
                  onChanged: (value) {
                    //Se cambia el tema de la app con u switch
                    String newTheme =
                        value ? ThemePreference.DARK : ThemePreference.LIGHT;
                    currentTheme.setTheme = newTheme;
                  }),
              Icon(Icons.brightness_2, color: currentThemeColor(currentTheme))
            ],
          )
        ],
      ),
    );
  }

  currentThemeColor(ThemeProvider currentTheme) {
    return currentTheme.isDarkTheme() ? Colors.white : Colors.black;
  }
}
