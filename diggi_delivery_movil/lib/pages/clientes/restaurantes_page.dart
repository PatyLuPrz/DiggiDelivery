import 'package:diggi_delivery_movil/blocs/pages/provider.dart';
import 'package:diggi_delivery_movil/blocs/pages/restaurantes/restaurantes_bloc.dart';
import 'package:diggi_delivery_movil/models/restaurante_model.dart';
import 'package:diggi_delivery_movil/pages/clientes/platillos_restaurante_cliente.dart';
import 'package:diggi_delivery_movil/providers/restaurantes_provider.dart';
import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart'
    as pref;
import 'package:flutter/material.dart';

class RestaurantesPage extends StatefulWidget {
  RestaurantesPage({Key key}) : super(key: key);

  @override
  _RestaurantesPageState createState() => _RestaurantesPageState();
}

class _RestaurantesPageState extends State<RestaurantesPage> {
  RestaurantesProvider restaurantesProvider = RestaurantesProvider();
  final prefs = new pref.PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    final restaurantesBloc = Provider.restaurantesBloc(context);
    restaurantesBloc.cargarRestaurantes();
    final size = MediaQuery.of(context).size;
    return Flexible(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            _barraDeBusqueda(size, restaurantesBloc),
            _popularesRestaurantes(size, restaurantesBloc),
          ],
        ),
      ),
    );
  }

  Widget _barraDeBusqueda(Size size, RestaurantesBloc restaurantesBloc) {
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
            hintText: "Encuentra un restaurante",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            fillColor: Colors.black,
            hintStyle: TextStyle(
              color: Color.fromRGBO(49, 49, 49, 1.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _popularesRestaurantes(Size size, RestaurantesBloc restaurantesBloc) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 1.0),
      height: size.height * 0.65,
      width: double.infinity,
      child: StreamBuilder(
        stream: restaurantesBloc.restaurantesStream,
        builder: (BuildContext context,
            AsyncSnapshot<List<RestauranteModel>> snapshot) {
          if (!snapshot.hasData)
            return Center(
                child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFFC93F42)),
            ));
          final restaurantes = snapshot.data;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: restaurantes.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 10.0),
                child: _cardTipo2(
                  restaurantes[index],
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

  _cardTipo2(RestauranteModel restauranteModel, Size size, int index) {
    return Transform.translate(
      offset: Offset(0.0, 0.0),
      child: InkWell(
        key: UniqueKey(),
        onTap: () {
          prefs.idLocal = restauranteModel.email;
          prefs.nombreRestaurantes = restauranteModel.nombre;
          Navigator.pushNamed(context, PlatillosRestauranteCliente.routeName,
                  arguments: restauranteModel.email)
              .then((value) => setState(() {}));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: _cardRestaurante(restauranteModel, size, index),
        ),
      ),
    );
  }

  Widget _cardRestaurante(
      RestauranteModel restauranteModel, Size size, int index) {
    return Container(
      color: Colors.primaries[index % Colors.primaries.length],
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Stack(
          children: <Widget>[
            _imagenRestaurante(restauranteModel, size, index),
            containerBlack(),
            _textCard(restauranteModel, size, index),
          ],
        ),
      ),
    );
  }

  Widget _imagenRestaurante(
      RestauranteModel restauranteModel, Size size, int index) {
    return Container(
      // clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: Colors.white),
      child: FadeInImage(
        placeholder: AssetImage('assets/img/original.gif'),
        image: NetworkImage(restauranteModel.foto),
        fadeInDuration: Duration(milliseconds: 200),
        height: size.height * 0.274,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  _textCard(RestauranteModel restauranteModel, Size size, int index) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            restauranteModel.nombre,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            restauranteModel.telefono,
            style: TextStyle(color: Colors.white),
          ),
        ],
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
