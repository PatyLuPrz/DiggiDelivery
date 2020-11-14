import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/models/model_pedidos.dart';
import 'package:diggi_delivery_movil/models/platillo_model.dart';
import 'package:diggi_delivery_movil/models/producto_model.dart';
import 'package:diggi_delivery_movil/providers/locales_provider.dart';
import 'package:diggi_delivery_movil/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class PedidoDetallesCliente extends StatefulWidget {
  PedidoDetallesCliente({Key key}) : super(key: key);
  static final routeName = "pedidoDetalleCliente";

  @override
  _PedidoDetallesClienteState createState() => _PedidoDetallesClienteState();
}

class _PedidoDetallesClienteState extends State<PedidoDetallesCliente> {
  ModelPedidos _modelPedidos = new ModelPedidos();
  @override
  Widget build(BuildContext context) {
    final ModelPedidos pedidoModelData =
        ModalRoute.of(context).settings.arguments;
    final size = MediaQuery.of(context).size;
    if (pedidoModelData != null) {
      _modelPedidos = pedidoModelData;
    }
    return SafeArea(
      child: Scaffold(
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
                    children: createListPlatillos(size, pedidoModelData),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Text('Productos'),
                Container(
                  width: double.infinity,
                  color: Colors.green,
                  child: Column(
                    // Or Row or whatever :)
                    children: _createListProductos(size, pedidoModelData),
                  ),
                ),
                _carritoData(size, pedidoModelData),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Column> createListPlatillos(Size size, ModelPedidos modelPedidos) {
    List<Column> childrenTexts = List<Column>();
    for (Subplatillo name in modelPedidos.platillo.subplatillo) {
      childrenTexts.add(
        Column(
          children: <Widget>[
            Text(
              name.idPlatillo,
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
      );
    }
    return childrenTexts;
  }

  List<Column> _createListProductos(Size size, ModelPedidos modelPedidos) {
    List<Column> childrenTexts = List<Column>();
    LocalesProvider localesProvider = LocalesProvider();
    ProductoModel prod = ProductoModel();
    for (Subproducto producto in modelPedidos.producto.subproducto) {
      childrenTexts.add(
        Column(
          children: <Widget>[
            Text(
              localesProvider
                  .listaProductoPedido(producto.idProducto)
                  .descripcion
                  .toString(),
              style: TextStyle(color: Colors.red),
            ),
            Text(
              producto.cantidad.toString(),
              style: TextStyle(color: Colors.red),
            ),
            Text(
              producto.precio.toString(),
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
      );
    }
    return childrenTexts;
  }

  _carritoData(Size size, ModelPedidos modelPedidos) {
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
          _total(size, modelPedidos),
        ],
      ),
    );
  }

  _total(Size size, ModelPedidos modelPedidos) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: size.width,
        height: size.width * 0.1,
        // color: Colors.red,
        alignment: Alignment.bottomRight,
        child: CustomText(
          size: 30.0,
          text: "\$${modelPedidos.total.toString()}.00",
          color: Colors.white,
        ),
      ),
    );
  }
}
