import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/blocs/pages/provider.dart';
import 'package:diggi_delivery_movil/blocs/pages/locales/locales_bloc.dart';
import 'package:diggi_delivery_movil/models/locales_model.dart';
import 'package:diggi_delivery_movil/pages/clientes/productos_locales_cliente.dart';
import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';

class LocalesPage extends StatefulWidget {
  LocalesPage({Key key}) : super(key: key);

  @override
  _LocalesPageState createState() => _LocalesPageState();
}

class _LocalesPageState extends State<LocalesPage> {
  final prefs = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    final localesBloc = Provider.localesBloc(context);
    localesBloc.cargarLocales();
    // final currentTheme = prov.Provider.of<ThemeProvider>(context);
    final size = MediaQuery.of(context).size;
    return Flexible(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            _barraDeBusqueda(size),
            _localesRegistros(size, localesBloc),
          ],
        ),
      ),
    );
  }

  Widget _barraDeBusqueda(Size size) {
    return Container(
      width: double.infinity,
      height: size.height * 0.09,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        title: TextField(
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Color.fromRGBO(49, 49, 49, 1.0),
              ),
              hintText: "Encuentra un establecimiento",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              fillColor: Color.fromRGBO(49, 49, 49, 1.0),
              hintStyle: TextStyle(color: Color.fromRGBO(49, 49, 49, 1.0))),
        ),
      ),
    );
  }

  Widget _localesRegistros(Size size, LocalesBloc localesBloc) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 1.0),
      height: size.height * 0.65,
      width: double.infinity,
      child: StreamBuilder(
        stream: localesBloc.localesStream,
        builder:
            (BuildContext context, AsyncSnapshot<List<LocalesModel>> snapshot) {
          if (!snapshot.hasData)
            return Center(
                child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFFC93F42)),
            ));
          final locales = snapshot.data;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: locales.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 10.0),
                child: _cardTipo2(
                  locales[index],
                  size,
                  index,
                ),
              );
            },
          );
        },
      ),
    );
  }

  _cardTipo2(LocalesModel localesModel, Size size, int index) {
    return Transform.translate(
      offset: Offset(0.0, 0.0),
      child: InkWell(
        key: UniqueKey(),
        onTap: () {
          prefs.idLocal = localesModel.email;
          prefs.nombreRestaurantes = localesModel.nombre;
          Navigator.pushNamed(context, ProductoLocalesCliente.routeName,
                  arguments: localesModel.email)
              .then((value) => setState(() {}));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: _cardLocales(localesModel, size, index),
        ),
      ),
    );
  }

  _cardLocales(localesModel, Size size, int index) {
    return Container(
      color: Colors.primaries[index % Colors.primaries.length],
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Stack(
          children: <Widget>[
            _imagenLocales(localesModel, size, index),
            containerBlack(),
            _textCard(localesModel, size, index),
          ],
        ),
      ),
    );
  }

  _imagenLocales(localesModel, Size size, int index) {
    return Container(
      // clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: Colors.white),
      child: FadeInImage(
        placeholder: AssetImage('assets/img/original.gif'),
        image: NetworkImage(localesModel.foto),
        fadeInDuration: Duration(milliseconds: 200),
        height: size.height * 0.274,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  containerBlack() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(0, 0, 0, 0.3),
    );
  }

  _textCard(localesModel, Size size, int index) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            localesModel.nombre,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            localesModel.telefono,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
