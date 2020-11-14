import 'package:diggi_delivery_movil/pages/clientes/inicio_clientes.dart';
import 'package:diggi_delivery_movil/pages/clientes/pedidos_clientes.dart';
import 'package:diggi_delivery_movil/pages/perfil_usuario_page.dart';
import 'package:diggi_delivery_movil/routes.dart';
import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final String routeName = 'homePageCliente';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  //Lista de BottomNavBar
  static const List<Widget> _widgetOptions = <Widget>[
    InicioClientes(),
    PedidosClientes(),
    PerfilUsuarioPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();

    prefs.ultimaPagina = HomePage.routeName;

    // final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: currentTheme.currentThemeColorComponents(currentTheme),
      //   elevation: 0.5,
      //   title: Align(
      //     alignment: Alignment.center,
      //     child: CustomText(
      //       text: 'Diggi Delivery',
      //       color: currentTheme.currentThemeColorText(currentTheme),
      //     ),
      //   ),
      // ),
      backgroundColor: Colors.white,
      body: SafeArea(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: _bottomNavigationBarCliente(),
      floatingActionButton: _floatingButton(),
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

  _floatingButton() {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      child: Icon(
        Icons.shopping_cart,
        color: Color.fromRGBO(202, 63, 67, 1.0),
      ),
      onPressed: () => Navigator.pushNamed(
        context,
        CarritoCompras.routeName,
      ).then((value) => setState(() {})),
      // arguments: platillos.documents[index].data)
    );
  }

  // void _urlLauncher() async {
  // _urlLauncher();
  // int phone = 527751284715;
  // String urlMensaje = "Hola";
  // var whatsappUrl = "whatsapp://send?phone=$phone?text=$urlMensaje";
  // await canLaunch(whatsappUrl) != null ? launch(whatsappUrl): print("open WhatsApp app link or do a snackbar with notification that there is no WhatsApp installed");
  // }
}
