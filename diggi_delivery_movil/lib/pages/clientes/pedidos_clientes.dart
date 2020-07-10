import 'package:diggi_delivery_movil/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PedidosClientes extends StatefulWidget {
  final String nombre;

  const PedidosClientes({Key key, this.nombre}) : super(key: key);

  @override
  _PedidosClientesState createState() => _PedidosClientesState();
}

class _PedidosClientesState extends State<PedidosClientes> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: currentTheme.currentThemeColorComponents(currentTheme),
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: currentTheme.currentThemeColorText(currentTheme)),
        title: Text(
          'Pedidos',
          style: TextStyle(
              color: currentTheme.currentThemeColorText(currentTheme)),
        ),
        backgroundColor: currentTheme.currentThemeColorComponents(currentTheme),
      ),
      drawer: _drawerPedidos(currentTheme),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          _listaPedidos('Gabi', '#000000001', 'Repartidor 1', currentTheme),
          _listaPedidos('Norberto', '#000000001', 'Repartidor 2', currentTheme),
          _listaPedidos('Beto', '#000000001', 'Repartidor 3', currentTheme),
          _listaPedidos('Jocelyn', '#000000001', 'Repartidor 4', currentTheme),
          _listaPedidos('Pato', '#000000001', 'Repartidor 5', currentTheme),
        ],
      ),
    );
  }

  Widget _listaPedidos(String nombre, String numero, String repartidor,
      ThemeProvider currentTheme) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  nombre,
                  style: TextStyle(
                      color: currentTheme.currentThemeColorText(currentTheme)),
                ),
                Text(
                  nombre,
                  style: TextStyle(
                      color: currentTheme.currentThemeColorText(currentTheme)),
                ),
                Text(
                  nombre,
                  style: TextStyle(
                      color: currentTheme.currentThemeColorText(currentTheme)),
                ),
              ],
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.chevron_right,
                  size: 30.0,
                  color: currentTheme.currentThemeColorText(currentTheme),
                ))
          ],
        ));
  }

  //Menu para acceder a los pedidos e historial del cliente
  Widget _drawerPedidos(ThemeProvider currentTheme) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: 60.0,
          width: double.infinity,
          child: DrawerHeader(
            child: Text(
              'Drawer Header',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: currentTheme.currentThemeColorText(currentTheme)),
            ),
            decoration: BoxDecoration(
                color: currentTheme.currentThemeColorComponents(currentTheme)),
          ),
        ),
        ListTile(
          title: Text('En camino'),
          onTap: () {
            // Actualiza el estado de la aplicación
            // ...
          },
        ),
        ListTile(
          title: Text('Compras'),
          onTap: () {
            // Actualiza el estado de la aplicación
            // ...
          },
        ),
      ],
    ));
  }
}
