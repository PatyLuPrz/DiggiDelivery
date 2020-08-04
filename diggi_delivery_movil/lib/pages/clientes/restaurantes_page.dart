import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/helpers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantesPage extends StatefulWidget {
  RestaurantesPage({Key key}) : super(key: key);

  @override
  _RestaurantesPageState createState() => _RestaurantesPageState();
}

class _RestaurantesPageState extends State<RestaurantesPage> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Container(
      child: Container(
        child: Column(
          children: <Widget>[
            _barraDeBusqueda(currentTheme),
            _categoriasText(),
            _popularesRestaurantes(currentTheme)
          ],
        ),
      ),
    );
  }

  Widget _barraDeBusqueda(ThemeProvider currentTheme) {
    return Container(
      decoration: BoxDecoration(
        color: currentTheme.currentThemeColorComponents(currentTheme),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        title: TextField(
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: currentTheme.currentThemeColorText(currentTheme),
              ),
              hintText: "Encuentra un restaurante",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              fillColor: currentTheme.currentThemeColorText(currentTheme),
              hintStyle: TextStyle(
                  color: currentTheme.currentThemeColorText(currentTheme))),
        ),
      ),
    );
  }

  Widget _popularesRestaurantes(ThemeProvider currentTheme) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 150.0,
      width: double.infinity,
      child: Center(
        child: StreamBuilder(
          stream: Firestore.instance.collection('restaurantes').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin:
                        EdgeInsets.only(right: 20.0, bottom: 10.0, top: 5.0),
                    padding: EdgeInsets.all(5.0),
                    width: 200.0,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          snapshot.data.documents[index].data['nombre'],
                        ),
                        Text(
                          snapshot
                              .data.documents[index].data['telefono'],
                        ),
                      ],
                    ),
                  );
                });
          },
        ),
      ),
    );
  }

  Widget _categorias(ThemeProvider currentTheme) {
    return Container();
  }

  Widget _categoriasText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: <Widget>[
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Categorias",
                style: TextStyle(fontSize: 20.0),
              )),
          SizedBox(
            height: 2.0,
          ),
          Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}

