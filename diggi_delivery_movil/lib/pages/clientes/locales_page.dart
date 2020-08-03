import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocalesPage extends StatefulWidget {
  LocalesPage({Key key}) : super(key: key);

  @override
  _LocalesPageState createState() => _LocalesPageState();
}

class _LocalesPageState extends State<LocalesPage> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Container(
      child: Container(
        child: Column(
          children: <Widget>[
            _barraDeBusqueda(currentTheme),
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
              hintText: "Encuentra un establecimiento",
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

  Widget _popularesEstablecimientos(ThemeProvider currentTheme) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 150.0,
      width: double.infinity,
      child: Center(
        child: StreamBuilder(
          stream: Firestore.instance.collection('platillos').snapshots(),
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
                              .data.documents[index].data['tiempo_preparacion'],
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

  Widget _popularesRestaurantes(ThemeProvider currentTheme) {
    return Container();
  }

  Widget _categorias(ThemeProvider currentTheme) {
    return Container();
  }
}
