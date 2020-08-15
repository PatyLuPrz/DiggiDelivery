import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/models/locales_model.dart';

class LocalesProvider {
  Firestore _db = Firestore();

  Stream<QuerySnapshot> getDocuments(String colection) {
    return _db.collection(colection).snapshots();
  }

  //Obtener registros
  Stream<QuerySnapshot> getLocales() {
    return Firestore.instance.collection('locales').snapshots();
  }

  //Insertar productos en la BD
  Future<bool> crearProducto(RegistroLocalModel producto) async {
    await _db.collection('restaurantes').document().setData(producto.toMap());
    return true;
  }
}
