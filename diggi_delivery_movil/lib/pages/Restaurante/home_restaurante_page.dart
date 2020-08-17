import 'package:diggi_delivery_movil/helpers/style.dart';
import 'package:diggi_delivery_movil/pages/Restaurante/inicio_restaurante.dart';
import 'package:diggi_delivery_movil/utils/theme_preferences.dart';
import 'package:diggi_delivery_movil/pages/clientes/inicio_clientes.dart';
import 'package:diggi_delivery_movil/pages/clientes/mapa_clientes.dart';
import 'package:diggi_delivery_movil/pages/clientes/pedidos_clientes.dart';
import 'package:diggi_delivery_movil/pages/local/inicio_local.dart';
import 'package:diggi_delivery_movil/pages/perfil_usuario_page.dart';
import 'package:diggi_delivery_movil/helpers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageRestaurante extends StatefulWidget {
  @override
  _HomePageRestauranteState createState() => _HomePageRestauranteState();
}

class _HomePageRestauranteState extends State<HomePageRestaurante> {
  int _selectedIndex = 0;

  //Lista de BottomNavBar
  static const List<Widget> _widgetOptions = <Widget>[
    InicioRestaurante(),
    PedidosClientes(),
    PerfilUsuarioPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: currentTheme.currentThemeColorComponents(currentTheme),
      body: SafeArea(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: _bottomNavigationBarCliente(),
    );
  }

  //Funcion del tap en cada parte del bottomnavigationbar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(index.toString());
    });
  }

  Widget _bottomNavigationBarCliente() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      iconSize: 30.0,
      elevation: 20.0,
      backgroundColor: Color.fromRGBO(49, 49, 49, 1.0),
      selectedItemColor: Color.fromRGBO(202, 63, 67, 1.0),
      unselectedItemColor: Color.fromRGBO(202, 63, 67, 0.6),
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        //Inicio
        bottomNavBarItem(Icon(Icons.home), 'Inicio'),
        //Pedidos
        bottomNavBarItem(Icon(Icons.add_shopping_cart), 'Pedidos'),
        //Yo
        bottomNavBarItem(Icon(Icons.person), 'Perfil'),
      ],
    );
  }

  bottomNavBarItem(Icon icon, String title) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(bottom: 2.0),
        child: icon,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 10.0),
      ),
    );
  }
}
