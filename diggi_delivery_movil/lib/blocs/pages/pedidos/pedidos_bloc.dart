import 'dart:async';

import 'package:diggi_delivery_movil/models/model_pedidos.dart';
import 'package:diggi_delivery_movil/providers/pedidos_provider.dart';
import 'package:rxdart/rxdart.dart';

class PedidosBloc {
  final _pedidosProvider = PedidosProvider();

  //StreamController
  final _pedidosController = BehaviorSubject<List<ModelPedidos>>();

  //Recuperar datos del stream
  Stream<List<ModelPedidos>> get pedidosStream => _pedidosController.stream;

  //Implementar metodos para cargar, agregar, etc, productos
  void cargarPedidos() async {
    final pedidos = await _pedidosProvider.getPedidos();
    _pedidosController.sink.add(pedidos);
  }

  dispose() {
    _pedidosController.close();
  }
}
