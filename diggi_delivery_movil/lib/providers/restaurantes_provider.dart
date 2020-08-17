import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diggi_delivery_movil/models/locales_model.dart';
import 'package:diggi_delivery_movil/models/platillo_model.dart';
import 'package:diggi_delivery_movil/models/restaurante_model.dart';

class RestaurantesProvider {
  Firestore _db = Firestore();

  Stream<QuerySnapshot> getDocuments(String colection) {
    return _db.collection(colection).snapshots();
  }

  //Obtener registros
  Stream<QuerySnapshot> getRestaurantes() {
    return Firestore.instance.collection('restaurantes').snapshots();
  }

  //Insertar platillos en la BD
  Future<bool> crearPlatillo(RegistroLocalModel platillo) async {
    await _db.collection('restaurantes').document().setData(platillo.toMap());
    return true;
  }

  //Obtiene los platillos de cada restaurante
  Stream<QuerySnapshot> getPlatilloRestaurante(String email) async* {
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

    //Conculta el email al que pertenece el restaurante
    Map<String, dynamic> decodeResp2 = new Map();
    List<PlatillosModel> decodeResp3 = new List();

    QuerySnapshot consultaPlatillos = await _db
        .collection('platillos')
        .where('restaurante', isEqualTo: idDocument)
        .getDocuments();


    // consultaPlatillos.documents.

    yield consultaPlatillos;
  }
}

// consultaPlatillos.documents.forEach((DocumentSnapshot element) {
//   print(element.documentID);
//   return decodeResp2 = element.data;
// });

//Imprime los valores que hay en restaurante con el id
// _db
//     .collection('restaurantes')
//     .document(idDocument)
//     .get()
//     .then((value) => {print(value.data.values)});
// PlatillosModel model = PlatillosModel();
// Map<String, dynamic> str;
// Map<String, dynamic> str2;
// Map<String, dynamic> str3 = _db.collection('platillos').snapshots().listen(
//   (QuerySnapshot data) {
//     data.documents.forEach(
//       (DocumentSnapshot document) {
//         if (document.data['restaurante'].path ==
//             'restaurantes/$idDocument') {
//           return str = document.data;
//           // return str.addAll({'id': document.documentID});
//         }
//         return str;
//       },
//     );

//     print("xDDDDDDDD :::: ${str.keys}");
//     return str2 = str;
//   },
// );
