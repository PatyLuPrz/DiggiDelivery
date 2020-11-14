import 'package:diggi_delivery_movil/models/model_pedidos.dart';
import 'package:diggi_delivery_movil/models/platillo_model.dart';
import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart';
import 'package:diggi_delivery_movil/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CarritoCompras extends StatefulWidget {
  CarritoCompras({Key key}) : super(key: key);
  static final routeName = "carritoCompras";

  @override
  _CarritoComprasState createState() => _CarritoComprasState();
}

class _CarritoComprasState extends State<CarritoCompras> {
  var list = ["one", "two", "three", "four", "five", "six"];
  PlatillosModel platillosModel = PlatillosModel();
  ModelPedidos modelPedidos = ModelPedidos();
  final prefs = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(49, 49, 49, 1.0),
        title: Text('Carrito de compras'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.02),
              Text('Platillos'),
              Container(
                width: double.infinity,
                color: Colors.black,
                child: Column(
                  // Or Row or whatever :)
                  children: createListPlatillos(size),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text('Productos'),
              Container(
                width: double.infinity,
                color: Colors.green,
                child: Column(
                  // Or Row or whatever :)
                  children: _createListProductos(size),
                ),
              ),
              _carritoData(size),
              _addToCart(platillosModel, modelPedidos, size)
            ],
          ),
        ),
      ),
    );
  }

  List<Column> createListPlatillos(Size size) {
    List<Column> childrenTexts = List<Column>();
    for (String name in list) {
      childrenTexts.add(
        Column(
          children: <Widget>[
            Text(
              name,
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
      );
    }
    return childrenTexts;
  }

  List<Column> _createListProductos(Size size) {
    List<Column> childrenTexts = List<Column>();
    for (String name in list) {
      childrenTexts.add(
        Column(
          children: <Widget>[
            Text(
              name,
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
      );
    }
    return childrenTexts;
  }

  _carritoData(Size size) {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      height: size.height * 0.3,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color.fromRGBO(49, 49, 49, 1.0),
      ),
      child: Stack(
        children: <Widget>[
          _total(size),
        ],
      ),
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
            // _pagar(platillosModel, modelPedidos);
          },
          icon: Icon(
            Icons.add_shopping_cart,
            color: Color.fromRGBO(49, 49, 49, 1.0),
          ),
          label: Text(
            'Realizar pedido',
            style: TextStyle(
              color: Color.fromRGBO(49, 49, 49, 1.0),
            ),
          ),
        ),
      ),
    );
  }

  _total(Size size) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: size.width,
        height: size.width * 0.1,
        // color: Colors.red,
        alignment: Alignment.bottomRight,
        child: CustomText(
          size: 30.0,
          text: "\$${prefs.total.toString()}.00",
          color: Colors.white,
        ),
      ),
    );
  }
}

_carritoData() {}
