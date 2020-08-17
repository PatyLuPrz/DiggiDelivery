import 'package:cloud_firestore/cloud_firestore.dart';
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
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFC93F42),
          title: Center(child: Text('Restaurante')),
        ),
        body: _crearGrid(context, localesProvider, size),
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

  Widget _crearGrid(
      BuildContext context, LocalesProvider localesProvider, Size size) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(5),
      child: StreamBuilder(
        stream: restaurantesProvider.getPlatilloRestaurante(prefs.email),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return Center(
                child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFFC93F42)),
            ));
          final platillos = snapshot.data;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: platillos.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot xd = platillos.documents[index];
              return Transform.translate(
                offset: Offset(0.0, index.isOdd ? 20 : 0),
                child: InkWell(
                  onTap: () => Navigator.pushNamed(
                          context, 'platilloRestaurante',
                          arguments: xd)
                      .then((value) => setState(() {})),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      color: Colors.primaries[index % Colors.primaries.length],
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        // child: Text(platillos.documents[index].data['nombre']),
                        // child: Text(platillos.documents[index].documentID),
                        child: Stack(
                          children: <Widget>[
                            _imagenAvatar(size, platillos, index),
                            containerBlack(),
                            Center(
                              child: ListTile(
                                title: Text(
                                  '${platillos.documents[index].data['nombre']}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                                // title:
                                //     Text(platillos.documents[index].documentID),
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

  Widget _imagenAvatar(Size size, QuerySnapshot platillos, int index) {
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
          image: NetworkImage(platillos.documents[index].data['foto'])),
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
