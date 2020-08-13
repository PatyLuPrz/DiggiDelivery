import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/helpers/theme.dart';
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
    final size = MediaQuery.of(context).size;
    return Flexible(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            _barraDeBusqueda(currentTheme, size),
            SizedBox(
              height: size.height * 0.015,
            ),
            _popularesEstablecimientos(currentTheme, size),
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

  Widget _popularesEstablecimientos(ThemeProvider currentTheme, Size size) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      height: size.height * 0.65,
      width: double.infinity,
      child: StreamBuilder(
        stream: Firestore.instance.collection('locales').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: snapshot.data.documents.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(right: 10.0, bottom: 10.0, top: 5.0, left: 10.0),
                padding: EdgeInsets.all(5.0),
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      snapshot.data.documents[index].data['nombre'],
                    ),
                    Text(
                      snapshot.data.documents[index].data['telefono'],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
