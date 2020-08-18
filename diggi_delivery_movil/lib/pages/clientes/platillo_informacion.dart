import 'dart:io';
import 'package:diggi_delivery_movil/blocs/pages/provider.dart';
import 'package:diggi_delivery_movil/blocs/pages/restaurantes/restaurantes_bloc.dart';
import 'package:diggi_delivery_movil/models/platillo_model.dart';
import 'package:flutter/material.dart';

class PlatilloInformacion extends StatefulWidget {
  static final routeName = "platilloInformacion";

  PlatilloInformacion({Key key}) : super(key: key);

  @override
  _PlatilloInformacionState createState() => _PlatilloInformacionState();
}

class _PlatilloInformacionState extends State<PlatilloInformacion> {
  //Key de los widget para evaluar las acciones a realizar
  // final formKey = GlobalKey<FormState>();

  RestaurantesBloc platilloRestaurante;
  PlatillosModel platillosModel = new PlatillosModel();
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  File foto;
  @override
  Widget build(BuildContext context) {
    platilloRestaurante = Provider.restaurantesBloc(context);
    final PlatillosModel platillosData =
        ModalRoute.of(context).settings.arguments;
    // print(platillosData.documentID);
    if (platillosData != null) {
      platillosModel = platillosData;
    }
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
            child: Column(
              children: <Widget>[_mostrarFoto(platillosModel)],
            ),
          
        ),
      ),
    );
  }

  Widget _mostrarFoto(PlatillosModel platillosModel) {
    if (platillosModel.foto != null) {
      return Hero(
        tag: 'idHero',
        child: FadeInImage(
          width: double.infinity,
          placeholder: AssetImage('assets/img/jar-loading.gif'),
          image: NetworkImage(platillosModel.foto),
          height: 300,
          fit: BoxFit.fill,
        ),
      );
    } else {
      return Image(
        image: AssetImage(foto?.path ?? 'assets/img/no-image.png'),
        fit: BoxFit.cover,
      );
    }
  }
}
