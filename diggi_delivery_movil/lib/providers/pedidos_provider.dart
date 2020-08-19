import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/models/model_pedidos.dart';
import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart';

class PedidosProvider {
  Firestore _db = Firestore();

  final prefs = PreferenciasUsuario();

  //Obtener pedidos
  Future<List<ModelPedidos>> getPedidos() async {
    //COnsulta para obtener los documentos de restaurantes
    QuerySnapshot consultaPlatillos =
        await _db.collection('pedidos').getDocuments();

    //Se crea una nueva lista del modelo de restaurantes
    final List<ModelPedidos> pedidos = new List();

    //Recorre los documentos para insertarlos en una lista de restaurantes
    consultaPlatillos.documents.forEach((producto) {
      final prodTemp = ModelPedidos.fromJson(producto.data);
      print(prodTemp);
      pedidos.add(prodTemp);
    });
    print(pedidos);
    return pedidos;
  }
}
