// import 'package:app_movies/src/models/pelicula_model.dart';
// import 'package:diggi_delivery_movil/models/platillo_model.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_swiper/flutter_swiper.dart';

// class CardSwiper extends StatelessWidget {
//   final List<PlatillosModel> peliculas;

//   CardSwiper({@required this.peliculas});

//   @override
//   Widget build(BuildContext context) {
//     final _screenSize = MediaQuery.of(context).size;

//     return Container(
//         padding: EdgeInsets.only(top: 10.0),
//         child: Swiper(
//           itemBuilder: (BuildContext context, int index) {
//             peliculas[index].uniqueId = '${peliculas[index].id}-tarjeta';

//             return Hero(
//               tag: peliculas[index].uniqueId,
//               child: ClipRRect(
//                   borderRadius: BorderRadius.circular(20.0),
//                   child: GestureDetector(
//                     onTap: ()=>Navigator.pushNamed(context, 'detalle', arguments: peliculas[index]),
//                     child: FadeInImage(
//                       placeholder: AssetImage('assets/img/no-image.jpg'),
//                       image: NetworkImage(peliculas[index].getPosterImg()),
//                       fit: BoxFit.cover,
//                     ),
//                   )),
//             );
//           },
//           itemCount: peliculas.length,
//           itemWidth: _screenSize.width * 0.7,
//           itemHeight: _screenSize.height * 0.5,
//           layout: SwiperLayout.STACK,
//         ));
//   }
// }
