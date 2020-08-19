import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/blocs/pages/locales/locales_bloc.dart';
import 'package:diggi_delivery_movil/blocs/pages/provider.dart';
import 'package:diggi_delivery_movil/pages/local/producto_local.dart';
import 'package:diggi_delivery_movil/providers/locales_provider.dart';
import 'package:diggi_delivery_movil/routes.dart';
import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';

class InicioLocal extends StatefulWidget {
  const InicioLocal({Key key}) : super(key: key);

  @override
  _InicioLocalState createState() => _InicioLocalState();
}

class _InicioLocalState extends State<InicioLocal> {
  LocalesProvider localesProvider = LocalesProvider();
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    final productosBloc = Provider.localesBloc(context);
    productosBloc.cargarProductos();
    final size = MediaQuery.of(context).size;

    // LocalesProvider localesProvider = LocalesProvider();
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFC93F42),
          title: Center(child: Text('Establecimiento')),
        ),
        body: _crearGrid(context, productosBloc, size),
        floatingActionButton: _crearBoton(context),
      ),
    );
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, ProductoLocal.routeName)
          .then((value) => setState(() {})),
      backgroundColor: Color(0xFFC93F42),
      child: Icon(Icons.add),
    );
  }

  _crearGrid(BuildContext context, LocalesBloc productosBloc, Size size) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(5),
      child: StreamBuilder(
        // stream: restaurantesProvider.getPlatilloRestaurante(prefs.email),
        stream: productosBloc.productosStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(
                valueColor:
                    new AlwaysStoppedAnimation<Color>(Color(0xFFC93F42)),
              ),
            );
          final productos = snapshot.data;
          return _gridView(context, productos, size);
        },
      ),
    );
  }

  _gridView(BuildContext context, productos, Size size) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemCount: productos.documents.length,
      itemBuilder: (context, index) {
        return _transformTralslate(context, index, productos, size);
      },
    );
  }

  _transformTralslate(BuildContext context, int index, productos, Size size) {
    return Transform.translate(
      offset: Offset(0.0, index.isOdd ? 20 : 0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, ProductoLocal.routeName,
                  arguments: productos.documents[index].data)
              .then((value) => setState(() {}));
          prefs.idUpdateRegistro = productos.documents[index].documentID;
          print(prefs.idUpdateRegistro);
        },
        child: _clipRRect(context, index, productos, size),
      ),
    );
  }

  _clipRRect(BuildContext context, int index, productos, Size size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: _stackCard(context, index, productos, size),
        ),
      ),
    );
  }

  _stackCard(BuildContext context, int index, productos, Size size) {
    return Stack(
      children: <Widget>[
        _imagenAvatar(size, productos, index),
        containerBlack(),
        _listText(context, index, productos),
      ],
    );
  }

  _imagenAvatar(Size size, productos, int index) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      // clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: Colors.white),
      child: FadeInImage(
        height: size.height * 2,
        width: size.width,
        fit: BoxFit.cover,
        placeholder: AssetImage('assets/img/original.gif'),
        image: NetworkImage(
          productos.documents[index].data['foto'],
        ),
      ),
    );
  }

  _listText(BuildContext context, int index, productos) {
    return Center(
      child: ListTile(
        title: Text(
          '${productos.documents[index].data['nombre']}',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}

containerBlack() {
  return Container(
    width: double.infinity,
    height: double.infinity,
    color: Color.fromRGBO(0, 0, 0, 0.3),
  );
}
