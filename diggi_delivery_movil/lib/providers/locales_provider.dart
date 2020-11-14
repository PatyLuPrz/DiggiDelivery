import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/models/locales_model.dart';
import 'package:diggi_delivery_movil/models/model_pedidos.dart';
import 'package:diggi_delivery_movil/models/producto_model.dart';
import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart';

class LocalesProvider {
  Firestore _db = Firestore();

  final prefs = PreferenciasUsuario();

  Stream<QuerySnapshot> getDocuments(String colection) {
    return _db.collection(colection).snapshots();
  }

  //Obtener registros
  Future<List<LocalesModel>> getLocales() async {
    //COnsulta para obtener los documentos de restaurantes
    QuerySnapshot consultaPlatillos =
        await _db.collection('locales').getDocuments();

    //Se crea una nueva lista del modelo de restaurantes
    final List<LocalesModel> locales = new List();

    //Recorre los documentos para insertarlos en una lista de restaurantes
    consultaPlatillos.documents.forEach((producto) {
      final prodTemp = LocalesModel.fromFirestore(producto.data);
      locales.add(prodTemp);
    });

    return locales;
  }

  // //Insertar productos en la BD
  // Future<bool> crearProducto(LocalesModel producto) async {
  //   await _db.collection('restaurantes').document().setData(producto.toMap());
  //   return true;
  // }

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

//Obtiene los productos de cada restaurante
  Future<QuerySnapshot> getProductosLocales(String email) async {
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

    QuerySnapshot consultaPlatillos = await _db
        .collection('productos')
        .where('local', isEqualTo: idDocument)
        .getDocuments();

    return consultaPlatillos;
  }

  //Regresa un booleano si el producto fue actualizado con exito
  Future<bool> editarProducto(ProductoModel productoModel) async {
    await _db
        .collection("productos")
        .document(prefs.idUpdateRegistro)
        .updateData(productoModel.toJson());

    return true;
  }

  //Regresa un booleano si el producto se pudo registrar con exito
  Future<bool> crearProducto(ProductoModel productoModel) async {
    await _db
        .collection('productos')
        .document()
        .setData(productoModel.toJson());

    return true;
  }

  Future<ProductoModel> listaProductoPedido(String idDocument) async {
    // Stream<DocumentSnapshot> consultaID;
    Map<String, dynamic> decodeResp = new Map();
    ProductoModel decode = ProductoModel();

    QuerySnapshot consultaProductos = await _db
        .collection('productos')
        .where('id_document', isEqualTo: idDocument)
        .getDocuments();

    consultaProductos.documents.forEach((element) {

      
    });

    print(decode.nombre);
    print(decode.descripcion);
    print(decode.foto);
    print(decode.local);
    print(decode.marca);

    return decode;
  }
}
