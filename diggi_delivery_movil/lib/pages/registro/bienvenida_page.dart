import 'package:diggi_delivery_movil/widgets/custom_text.dart';
import 'package:diggi_delivery_movil/widgets/text_title.dart';
import 'package:flutter/material.dart';

class BienvenidaPage extends StatelessWidget {
  static final String routeName = 'registroBienvenida';

  const BienvenidaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  //Titulo de bienvenida
                  TextTitle(
                      text: "¡Bienvenido!",
                      size: 30.0,
                      color: Color(0xFF1D1D1D),
                      weight: FontWeight.w400),
                  SizedBox(height: size.height * 0.03),
                  //Texto de bienvenida
                  CustomText(
                      text:
                          "¿De qué manera desea ser parte de Diggi Delivery?"),
                  SizedBox(height: size.height * 0.05),
                  _cardUser('Cliente', 'cliente.png', size, context, "cliente"),
                  SizedBox(height: size.height * 0.03),
                  _cardUser('Local', 'local.png', size, context, "local"),
                  SizedBox(height: size.height * 0.03),
                  _cardUser('Restaurante', 'restaurant.png', size, context,
                      "restaurante"),
                  SizedBox(height: size.height * 0.03),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _cardUser(String mensaje, String imagen, Size size,
      BuildContext context, String tipoUsuario) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, tipoUsuario),
      child: Container(
        height: size.height * 0.2,
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/img/$imagen',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.black45),
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      mensaje,
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
