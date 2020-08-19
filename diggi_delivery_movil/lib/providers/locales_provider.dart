import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/models/locales_model.dart';
import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart';

class LocalesProvider {
  Firestore _db = Firestore();

  final prefs = PreferenciasUsuario();

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

  Future<QuerySnapshot> getProductoLocal(email) async {
    //COnsulta a la tabla de restaurantes
    int index = 0;

    //Conculta el email al que pertenece el restaurante
    QuerySnapshot consultaEmail = await _db
        .collection('locales')
        .where('email', isEqualTo: email)
        .getDocuments();

    //Genera un Map en la respuesta de la consulta a la tabla de restaurantes con el email
    Map<String, dynamic> decodeResp;

    //Recorre la consulta de restaurantes para obtener los datos del restaurante
    consultaEmail.documents.forEach((DocumentSnapshot element) {
      return decodeResp = element.data;
    });

    //Como solo existe un registro con el mismo email obtiene el id del documento de restaurante al que pertene el correo
    var idDocument = consultaEmail.documents[index].documentID;
    prefs.idRestaurante = idDocument;

    QuerySnapshot consultaProductos = await _db
        .collection('productos')
        .where('local', isEqualTo: idDocument)
        .getDocuments();

    return consultaProductos;
  }
}
