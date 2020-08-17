import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/helpers/theme.dart';
import 'package:diggi_delivery_movil/providers/locales_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantesPage extends StatefulWidget {
  RestaurantesPage({Key key}) : super(key: key);

  @override
  _RestaurantesPageState createState() => _RestaurantesPageState();
}

class _RestaurantesPageState extends State<RestaurantesPage> {
  LocalesProvider localesProvider = LocalesProvider();
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    final size = MediaQuery.of(context).size;
    return Flexible(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            _barraDeBusqueda(currentTheme, size),
            _popularesRestaurantes(currentTheme, size),
          ],
        ),
      ),
    );
  }

  Widget _barraDeBusqueda(ThemeProvider currentTheme, Size size) {
    return Container(
      width: double.infinity,
      height: size.height * 0.09,
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

  Widget _popularesRestaurantes(ThemeProvider currentTheme, Size size) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 1.0),
      height: size.height * 0.65,
      width: double.infinity,
      child: StreamBuilder(
        stream: localesProvider.getDocuments('restaurantes'),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: snapshot.data.documents.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(top: 10.0),
                child: _cardTipo2(snapshot, size, index),
              );
            },
          );
        },
      ),
    );
  }

  _cardTipo2(AsyncSnapshot snapshot, Size size, int index) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10.0,
          spreadRadius: 2.0,
          offset: Offset(2.0, 10.0),
        )
      ], borderRadius: BorderRadius.circular(10.0), color: Colors.white),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: _cardRestaurante(snapshot, size, index),
      ),
    );
  }

  Widget _cardRestaurante(AsyncSnapshot snapshot, Size size, int index) {
    
    return Stack(
      children: <Widget>[
        _imagenRestaurante(snapshot, size, index),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
            width: size.width * 0.505,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  snapshot.data.documents[index].data['nombre'],
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  snapshot.data.documents[index].data["direccion"],
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _imagenRestaurante(AsyncSnapshot snapshot, Size size, int index) {
    return Container(
      // clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: Colors.white),
      child: FadeInImage(
        placeholder: AssetImage('assets/img/original.gif'),
        image: NetworkImage(
            "https://media-cdn.tripadvisor.com/media/photo-s/18/1a/96/54/main-restaurant.jpg"),
        fadeInDuration: Duration(milliseconds: 200),
        height: size.height * 0.274,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
