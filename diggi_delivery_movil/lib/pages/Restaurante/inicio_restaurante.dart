import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/blocs/pages/restaurantes/restaurantes_bloc.dart';
import 'package:diggi_delivery_movil/models/platillo_model.dart';
import 'package:diggi_delivery_movil/providers/locales_provider.dart';
import 'package:diggi_delivery_movil/providers/restaurantes_provider.dart';
import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';

class InicioRestaurante extends StatefulWidget {
  const InicioRestaurante({Key key}) : super(key: key);

  @override
  _InicioRestauranteState createState() => _InicioRestauranteState();
}

class _InicioRestauranteState extends State<InicioRestaurante> {
  RestaurantesProvider restaurantesProvider = RestaurantesProvider();
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    LocalesProvider localesProvider = LocalesProvider();
    // final productosBloc = Provider.productosBloc(context);
    // productosBloc.cargarProductos();
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFC93F42),
          title: Center(child: Text('Restaurante')),
        ),
        body: _crearGrid(context, localesProvider, size),
        // body: _crearListado(),
        floatingActionButton: _crearBoton(context),
      ),
    );
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, 'platilloRestaurante')
          .then((value) => setState(() {})),
      backgroundColor: Color(0xFFC93F42),
      child: Icon(Icons.add),
    );
  }

  Widget _crearListado(Size size) {
    return StreamBuilder(
      stream: restaurantesProvider.getPlatilloRestaurante(prefs.email),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          final productos = snapshot.data;
          return ListView.builder(
            itemCount: productos.documents.length,
            itemBuilder: (context, i) =>
                _crearItem(context, productos, i, size),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(
      BuildContext context, QuerySnapshot productos, int i, Size size) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) => null,
      child: Card(
        child: Column(
          children: <Widget>[
            // (producto.foto == null)
            //     ? Image(
            //         image: AssetImage('assets/no-image.png'),
            //       )
            //     : FadeInImage(
            //         placeholder: AssetImage('assets/jar-loading.gif'),
            //         image: NetworkImage(producto.id),
            //         height: 300.0,
            //         width: double.infinity,
            //         fit: BoxFit.cover,
            //       ),
            ListTile(
                title: Text('${productos.documents[i].data['nombre']}'),
                onTap: () => null),
          ],
        ),
      ),
    );
  }

  Widget _crearGrid(
      BuildContext context, LocalesProvider localesProvider, Size size) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(5),
      child: StreamBuilder(
        stream: restaurantesProvider.getPlatilloRestaurante(prefs.email),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          final productos = snapshot.data;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: productos.documents.length,
            itemBuilder: (context, index) {
              return Transform.translate(
                offset: Offset(0.0, index.isOdd ? 20 : 0),
                child: InkWell(
                  onTap: () => Navigator.pushNamed(
                          context, 'platilloRestaurante',
                          arguments: productos)
                      .then((value) => setState(() {})),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      color: Colors.primaries[index % Colors.primaries.length],
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        // child: Text(productos.documents[index].data['nombre']),
                        // child: Text(productos.documents[index].documentID),
                        child: Stack(
                          children: <Widget>[
                            _imagenAvatar(size, productos, index),
                            containerBlack(),
                            Center(
                              child: ListTile(
                                title: Text(
                                  '${productos.documents[index].data['nombre']}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                                // title:
                                //     Text(productos.documents[index].documentID),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _imagenAvatar(Size size, QuerySnapshot productos, int index) {
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
          image: NetworkImage(productos.documents[index].data['foto'])),
    );
  }

  Widget containerBlack() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(0, 0, 0, 0.3),
    );
  }
}
