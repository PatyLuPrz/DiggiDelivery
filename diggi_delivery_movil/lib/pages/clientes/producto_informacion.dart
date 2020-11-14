import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/blocs/pages/locales/locales_bloc.dart';
import 'package:diggi_delivery_movil/blocs/pages/provider.dart';
import 'package:diggi_delivery_movil/blocs/pages/restaurantes/restaurantes_bloc.dart';
import 'package:diggi_delivery_movil/models/model_pedidos.dart';
import 'package:diggi_delivery_movil/models/platillo_model.dart';
import 'package:diggi_delivery_movil/models/producto_model.dart';
import 'package:flutter/material.dart';

class ProductoInformacion extends StatefulWidget {
  static final routeName = "ProductoInformacion";

  ProductoInformacion({Key key}) : super(key: key);

  @override
  _ProductoInformacionState createState() => _ProductoInformacionState();
}

class _ProductoInformacionState extends State<ProductoInformacion> {
  //Key de los widget para evaluar las acciones a realizar
  // final formKey = GlobalKey<FormState>();
  LocalesBloc _localesBloc;
  ProductoModel _productoModel = new ProductoModel();
  ModelPedidos modelPedidos = new ModelPedidos();
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  File foto;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _localesBloc = Provider.localesBloc(context);
    final Map<String, dynamic> localesData =
        ModalRoute.of(context).settings.arguments;
    // print(localesData.documentID);
    if (localesData != null) {
      localesData.forEach((key, value) {
        _productoModel = ProductoModel.fromJson(localesData);
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
      body: Container(
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
                child: _mostrarFoto(_productoModel),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                elevation: 1,
                margin: EdgeInsets.all(5),
              ),
            ),

            foodTitleWidget(_productoModel),
            SizedBox(
              height: 15,
            ),
            detailContentMenu(_productoModel),
            // AddToCartMenu(),
            SizedBox(
              height: size.height * 0.1,
            ),
            _addToCart(_productoModel, modelPedidos, size),
            // bottomMenu(),
          ],
        ),
      ),
    );
  }

  Widget _mostrarFoto(ProductoModel _productoModel) {
    if (_productoModel.foto != null) {
      return Hero(
        tag: 'idHero',
        child: FadeInImage(
          width: double.infinity,
          placeholder: AssetImage('assets/img/jar-loading.gif'),
          image: NetworkImage(_productoModel.foto),
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

  Widget detailContentMenu(ProductoModel _productoModel) {
    return Container(
      child: Text(
        _productoModel.descripcion.presentacion,
        style: TextStyle(
            fontSize: 14.0,
            color: Colors.black87,
            fontWeight: FontWeight.w400,
            height: 1.50),
        textAlign: TextAlign.center,
      ),
    );
  }

  foodTitleWidget(ProductoModel _productoModel) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              _productoModel.nombre,
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF3a3a3b),
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "\$ ${_productoModel.descripcion.precio.toString()}.00",
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
              "Marca: ",
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFa9a9a9),
                  fontWeight: FontWeight.w400),
            ),
            Text(
              _productoModel.marca,
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
      ProductoModel productoModel, ModelPedidos modelPedidos, Size size) {
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
          onPressed: () {},
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
}
