import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/pages/clientes/locales_page.dart';
import 'package:diggi_delivery_movil/pages/clientes/restaurantes_page.dart';
import 'package:diggi_delivery_movil/providers/theme.dart';
import 'package:diggi_delivery_movil/widgets/text_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InicioClientes extends StatelessWidget {
  final String nombre;

  const InicioClientes({Key key, this.nombre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String lugar = "Restaurante";
    final currentTheme = Provider.of<ThemeProvider>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(child: Container()),
                  TabBar(
                    labelColor: Color(0xFFC93F42),
                    indicatorColor: Colors.red,
                    unselectedLabelColor: Colors.grey,
                    unselectedLabelStyle: TextStyle(color: Colors.blue),
                    tabs: <Widget>[
                      Tab(
                        icon: Icon(Icons.fastfood),
                        text: "Restaurante",
                      ),
                      Tab(
                          icon: Icon(Icons.shopping_cart),
                          text: "Establecimiento"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Column(
              children: <Widget>[SizedBox(height: 10.0), RestaurantesPage()],
            ),
            Column(
              children: <Widget>[SizedBox(height: 10.0), LocalesPage()],
            )
          ],
        ),
      ),
    );
  }
}
