import 'package:diggi_delivery_movil/blocs/pages/provider.dart';
import 'package:diggi_delivery_movil/blocs/pages/restaurantes/restaurantes_bloc.dart';
import 'package:diggi_delivery_movil/models/platillo_model.dart';
import 'package:diggi_delivery_movil/pages/clientes/platillo_informacion.dart';
import 'package:diggi_delivery_movil/providers/restaurantes_provider.dart';
import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart';
import 'package:flutter/material.dart';

class PlatillosRestauranteCliente extends StatefulWidget {
  const PlatillosRestauranteCliente({Key key}) : super(key: key);
  static final routeName = "platilloRestaurante";
  @override
  _PlatillosRestauranteClienteState createState() =>
      _PlatillosRestauranteClienteState();
}

class _PlatillosRestauranteClienteState
    extends State<PlatillosRestauranteCliente> {
  RestaurantesProvider restaurantesProvider = RestaurantesProvider();
  final prefs = new PreferenciasUsuario();
  String email;
  @override
  Widget build(BuildContext context) {
    final String emailData = ModalRoute.of(context).settings.arguments;
    final size = MediaQuery.of(context).size;
    if (emailData != null) {
      email = emailData;
    }
    prefs.idRestaurante = email;
    final platillosBloc = Provider.restaurantesBloc(context);
    platillosBloc.cargarPlatillosCliente();

    // LocalesProvider localesProvider = LocalesProvider();
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFC93F42),
          title: Center(child: Text(prefs.nombreRestaurantes)),
        ),
        body: _crearGrid(context, platillosBloc, size),
      ),
    );
  }

  Widget _crearGrid(
      BuildContext context, RestaurantesBloc restaurantesBloc, Size size) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(5),
      child: StreamBuilder(
        // stream: restaurantesProvider.getPlatilloRestaurante(prefs.email),
        stream: restaurantesBloc.platillosClienteStream,
        builder: (BuildContext context,
            AsyncSnapshot<List<PlatillosModel>> snapshot) {
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
            itemCount: platillos.length,
            itemBuilder: (context, index) {
              // DocumentSnapshot xd = platillos.documents[index];
              return Transform.translate(
                offset: Offset(0.0, index.isOdd ? 20 : 0),
                child: InkWell(
                  key: UniqueKey(),
                  onTap: () => Navigator.pushNamed(
                          context, PlatilloInformacion.routeName,
                          arguments: platillos[index])
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
                            _imagenAvatar(size, platillos[index], index),
                            containerBlack(),
                            Center(
                              child: ListTile(
                                title: Text(
                                  // '${platillos.documents[index].data['nombre']}',
                                  '${platillos[index].nombre}',
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

  Widget _imagenAvatar(Size size, PlatillosModel platillos, int index) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      // clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: Colors.white),
      child: Hero(
        tag: new Text('hero1'),
        child: FadeInImage(
            height: size.height * 2,
            width: size.width,
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/img/original.gif'),
            // image: NetworkImage(platillos.documents[index].data['foto'])),
            image: NetworkImage(platillos.foto)),
      ),
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
