import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/models/locales_model.dart';
import 'package:diggi_delivery_movil/models/platillo_model.dart';
import 'package:diggi_delivery_movil/models/restaurante_model.dart';
import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart';

class RestaurantesProvider {
  Firestore _db = Firestore();
  final prefs = PreferenciasUsuario();

  Future<List<RestauranteModel>> getRestaurantes() async {
    //COnsulta para obtener los documentos de restaurantes
    QuerySnapshot consultaPlatillos =
        await _db.collection('restaurantes').getDocuments();

    //Se crea una nueva lista del modelo de restaurantes
    final List<RestauranteModel> productos = new List();

    //Recorre los documentos para insertarlos en una lista de restaurantes
    consultaPlatillos.documents.forEach((producto) {
      final prodTemp = RestauranteModel.fromFirestore(producto.data);
      productos.add(prodTemp);
    });

    return productos;
  }

  // //Obtener registros
  // Stream<QuerySnapshot> getRestaurantes() {
  //   return Firestore.instance.collection('restaurantes').snapshots();
  // }

  //Insertar platillos en la BD
  // Future<bool> crearPlatillo(RegistroLocalModel platillo) async {
    
  //   return true;
  // }

  //Obtiene los platillos de cada restaurante
  Future<QuerySnapshot> getPlatilloRestaurante(String email) async {
    //COnsulta a la tabla de restaurantes
    int index = 0;

    //Conculta el email al que pertenece el restaurante
    QuerySnapshot consultaEmail = await _db
        .collection('restaurantes')
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
        .collection('platillos')
        .where('restaurante', isEqualTo: idDocument)
        .getDocuments();

    return consultaPlatillos;
  }

  //Insertar nuevo platillo en la BD
  Future<bool> crearPlatillo(PlatillosModel platillosModel) async {
    await _db.collection('platillos').document().setData(platillosModel.toMap());


    // final url = '$_url/productos.json?auth=${_prefs.token}';

    // final resp = await http.post(url, body: productoModelToJson(producto));

    // final decodedData = json.decode(resp.body);

    // print(decodedData);

    return true;
  }
}
