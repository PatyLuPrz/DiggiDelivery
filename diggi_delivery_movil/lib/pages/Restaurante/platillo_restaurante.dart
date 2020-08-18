import 'dart:io';

import 'package:diggi_delivery_movil/blocs/pages/provider.dart';
import 'package:diggi_delivery_movil/blocs/pages/restaurantes/restaurantes_bloc.dart';
import 'package:diggi_delivery_movil/models/platillo_model.dart';
import 'package:diggi_delivery_movil/widgets/input_decoration.dart';
import 'package:flutter/material.dart';

class PlatilloRestaurante extends StatefulWidget {
  static final routeName = "platilloRestaurante";
  @override
  _PlatilloRestauranteState createState() => _PlatilloRestauranteState();
}

class _PlatilloRestauranteState extends State<PlatilloRestaurante> {
  //Key de los widget para evaluar las acciones a realizar
  final formKey = GlobalKey<FormState>();

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
      appBar: AppBar(
        backgroundColor: Color(0xFFC93F42),
        title: Text('Platillo'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.photo_size_select_actual), onPressed: () {}),
          IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Introducir la información necesaria para agregar un nuevo producto",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        _mostrarFoto(platillosModel),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  _crearNombre(platillosModel),
                  SizedBox(height: 15.0),
                  _crearDescripcion(platillosModel),
                  SizedBox(height: 15.0),
                  _ingredientesExtra(platillosModel),
                  SizedBox(height: 15.0),
                  _crearPrecio(platillosModel),
                  SizedBox(height: 15.0),
                  _tiempoDePreparacion(platillosModel),
                  SizedBox(height: 15.0),
                  _crearBoton(platillosModel),
                  SizedBox(height: 15.0),
                ],
              )),
        ),
      ),
    );
  }

  Widget _crearNombre(PlatillosModel platillosData) {
    final dec = DecorationInputForm(
        textLabel: "Nombre del platillo",
        textHint: "Pizza hawuaiana",
        icon: Icons.fastfood);
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.text,
        initialValue: platillosData.nombre,
        enabled: true,
        decoration: dec.decoration(),
      ),
    );
  }

  Widget _crearDescripcion(PlatillosModel platillosData) {
    final dec = DecorationInputForm(
        textLabel: "Descripción",
        textHint: "Pizza hawuaiana con queso...",
        icon: Icons.copyright);
    return Container(
      child: TextFormField(
        maxLines: null,
        keyboardType: TextInputType.multiline,
        initialValue: platillosData.descripcion,
        enabled: true,
        decoration: dec.decoration(),
      ),
    );
  }

  Widget _ingredientesExtra(PlatillosModel platillosData) {
    final dec = DecorationInputForm(
        textLabel: "Ingredientes extra",
        textHint: "Extra queso, extra piña...",
        icon: Icons.view_list);
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.text,
        initialValue: platillosData.ingredientes?.toString()??'',
        enabled: true,
        decoration: dec.decoration(),
      ),
    );
  }

  Widget _crearPrecio(PlatillosModel platillosData) {
    final dec = DecorationInputForm(
        textLabel: "Precio de platillo",
        textHint: "100.0",
        icon: Icons.attach_money);
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      // initialValue: platillosData.data['precio'].toString(),
      initialValue: platillosData.precio.toString(),
      decoration: dec.decoration(),
    );
  }

  Widget _tiempoDePreparacion(PlatillosModel platillosData) {
    final dec = DecorationInputForm(
        textLabel: "Tiempo de preparación",
        textHint: "30 minutos",
        icon: Icons.storage);
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      initialValue: platillosData.tiempoPreparacion,
      decoration: dec.decoration(),
    );
  }

  Widget _crearBoton(PlatillosModel platillosData) {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Color(0xFFC93F42),
      textColor: Colors.white,
      label: Text('Guardar platillo'),
      icon: Icon(Icons.save),
      onPressed: () {},
    );
  }

  Widget _mostrarFoto(PlatillosModel platillosModel) {
    if (platillosModel.foto != null) {
      return FadeInImage(
        width: double.infinity,
        placeholder: AssetImage('assets/img/jar-loading.gif'),
        image: NetworkImage(platillosModel.foto),
        height: 180,
        fit: BoxFit.fill,
      );
    } else {
      return Image(
        image: AssetImage(foto?.path ?? 'assets/img/no-image.png'),
        fit: BoxFit.cover,
      );
    }
  }
}
