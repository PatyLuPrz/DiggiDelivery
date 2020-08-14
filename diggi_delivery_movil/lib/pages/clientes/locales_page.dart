import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/blocs/pages/Login/provider.dart';
import 'package:diggi_delivery_movil/blocs/pages/locales/locales_bloc.dart';
import 'package:diggi_delivery_movil/helpers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as prov;

class LocalesPage extends StatefulWidget {
  LocalesPage({Key key}) : super(key: key);

  @override
  _LocalesPageState createState() => _LocalesPageState();
}

class _LocalesPageState extends State<LocalesPage> {
  @override
  Widget build(BuildContext context) {
    final localesBloc = Provider.localesBloc(context);
    localesBloc.cargarLocales();
    final currentTheme = prov.Provider.of<ThemeProvider>(context);
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
            _localesRegistros(currentTheme, size, localesBloc),
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

  Widget _localesRegistros(
      ThemeProvider currentTheme, Size size, LocalesBloc localesBloc) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      height: size.height * 0.65,
      width: double.infinity,
      child: StreamBuilder<QuerySnapshot>(
        stream: localesBloc.localesStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: snapshot.data.documents.length,
            itemBuilder: (BuildContext context, int index) {
              final DocumentSnapshot document = snapshot.data.documents[index];
              return Container(
                margin: EdgeInsets.only(
                    right: 10.0, bottom: 10.0, top: 5.0, left: 10.0),
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
                      document["nombre"],
                    ),
                    Text(
                      document["telefono"],
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
