import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/blocs/pages/provider.dart';
import 'package:diggi_delivery_movil/blocs/pages/restaurantes/restaurantes_bloc.dart';
import 'package:diggi_delivery_movil/models/model_pedidos.dart';
import 'package:diggi_delivery_movil/models/platillo_model.dart';
import 'package:diggi_delivery_movil/providers/locales_provider.dart';
import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart';
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
  ModelPedidos modelPedidos = new ModelPedidos();
  final prefs = PreferenciasUsuario();
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  File foto;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    platilloRestaurante = Provider.restaurantesBloc(context);
    final Map<String, dynamic> platillosData =
        ModalRoute.of(context).settings.arguments;
    // print(platillosData.documentID);
    if (platillosData != null) {
      platillosData.forEach((key, value) {
        platillosModel = PlatillosModel.fromFirestore(platillosData);
      });
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF3a3737),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        brightness: Brightness.light,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: size.height * 0.5,
                child: Card(
                  // semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: _mostrarFoto(platillosModel),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  elevation: 1,
                  margin: EdgeInsets.all(5),
                ),
              ),

              foodTitleWidget(
                  productName: "Grilled Salmon",
                  productPrice: "\$96.00",
                  productHost: "pizza hut",
                  platillosModel: platillosModel),
              SizedBox(
                height: 15,
              ),
              detailContentMenu(platillosModel),
              // AddToCartMenu(),
              SizedBox(
                height: size.height * 0.1,
              ),
              _addToCart(platillosModel, modelPedidos, size),
              // bottomMenu(),
            ],
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

  Widget detailContentMenu(PlatillosModel platillosModel) {
    return Container(
      child: Text(
        platillosModel.descripcion,
        style: TextStyle(
            fontSize: 14.0,
            color: Colors.black87,
            fontWeight: FontWeight.w400,
            height: 1.50),
        textAlign: TextAlign.center,
      ),
    );
  }

  foodTitleWidget(
      {String productName,
      String productPrice,
      String productHost,
      PlatillosModel platillosModel}) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              platillosModel.nombre,
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF3a3a3b),
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "\$ ${platillosModel.precio.toString()}.00",
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF3a3a3b),
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            Text(
              "Preparacion (aprox): ",
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFa9a9a9),
                  fontWeight: FontWeight.w400),
            ),
            Text(
              platillosModel.tiempoPreparacion,
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF1f1f1f),
                  fontWeight: FontWeight.w400),
            ),
          ],
        )
      ],
    );
  }

  Widget _addToCart(
      PlatillosModel platillosModel, ModelPedidos modelPedidos, Size size) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size.height * 0.09,
        width: size.width * 0.9,
        child: RaisedButton.icon(
          color: Color.fromRGBO(202, 63, 67, 1.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Color.fromRGBO(49, 49, 49, 1.0))),
          onPressed: () {
            _carrito(platillosModel, modelPedidos);
          },
          icon: Icon(
            Icons.add_shopping_cart,
            color: Color.fromRGBO(49, 49, 49, 1.0),
          ),
          label: Text(
            'Añadir al carrito',
            style: TextStyle(
              color: Color.fromRGBO(49, 49, 49, 1.0),
            ),
          ),
        ),
      ),
    );
  }

  void _carrito(PlatillosModel platillosModel, ModelPedidos modelPedidos) {
    print("IDdocumentplatillo: ${prefs.idDocumentPlatilloProducto}");
    print("IDrestaurante: ${prefs.idRestaurante}");
    print("Precio de producto: ${platillosModel.precio}");
    print("Cantidad de platillos: ${platillosModel.cantidad += 1}");
    print("Precio platillo: ${platillosModel.precio.toString()}");

    print("Precio pedido: ${prefs.total.toString()}");
    LocalesProvider localesProvider = LocalesProvider();
    // localesProvider.listaProductoPedido(prefs.idDocumentPlatilloProducto);
  }
}
