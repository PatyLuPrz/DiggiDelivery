import 'package:diggi_delivery_movil/models/model_pedidos.dart';
import 'package:flutter/material.dart';

class PedidoDetallesCliente extends StatefulWidget {
  PedidoDetallesCliente({Key key}) : super(key: key);
  static final routeName = "pedidoDetalleCliente";

  @override
  _PedidoDetallesClienteState createState() => _PedidoDetallesClienteState();
}

class _PedidoDetallesClienteState extends State<PedidoDetallesCliente> {
  List<ModelPedidos> _modelPedidos = new List();
  @override
  Widget build(BuildContext context) {
    final List<ModelPedidos> pedidoModelData =
        ModalRoute.of(context).settings.arguments;
    final size = MediaQuery.of(context).size;
    if (pedidoModelData != null) {
      _modelPedidos = pedidoModelData;
    }
    return Container(
      child: Container(),
    );
  }
}
