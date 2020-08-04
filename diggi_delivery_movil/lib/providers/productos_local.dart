


// Widget _popularesRestaurantes(ThemeProvider currentTheme) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 20.0),
//       height: 150.0,
//       width: double.infinity,
//       child: Center(
//         child: StreamBuilder(
//           stream: Firestore.instance.collection('platillos').snapshots(),
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (!snapshot.hasData) return CircularProgressIndicator();
//             return ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 shrinkWrap: true,
//                 physics: ClampingScrollPhysics(),
//                 itemCount: snapshot.data.documents.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Container(
//                     margin:
//                         EdgeInsets.only(right: 20.0, bottom: 10.0, top: 5.0),
//                     padding: EdgeInsets.all(5.0),
//                     width: 200.0,
//                     height: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8.0),
//                       color: Colors.white,
//                     ),
//                     child: Column(
//                       children: <Widget>[
//                         Text(
//                           snapshot.data.documents[index].data['nombre'],
//                         ),
//                         Text(
//                           snapshot
//                               .data.documents[index].data['tiempo_preparacion'],
//                         ),
//                       ],
//                     ),
//                   );
//                 });
//           },
//         ),
//       ),
//     );
//   }
