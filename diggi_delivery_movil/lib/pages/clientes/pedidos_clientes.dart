import 'package:flutter/material.dart';

class PedidosClientes extends StatelessWidget {
  final String nombre;

  const PedidosClientes({Key key, this.nombre}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          _listaPedidos('Gabi', '#000000001', 'Repartidor 1'),
          _listaPedidos('Norberto', '#000000001', 'Repartidor 2'),
          _listaPedidos('Beto', '#000000001', 'Repartidor 3'),
          _listaPedidos('Jocelyn', '#000000001', 'Repartidor 4'),
          _listaPedidos('Pato', '#000000001', 'Repartidor 5'),
        ],
      ),
    );
  }

  Widget _listaPedidos(String nombre, String numero, String repartidor) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
        height: 50,
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(nombre),
                Text(nombre),
                Text(nombre),
              ],
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.chevron_right,
                  size: 30.0,
                ))
          ],
        ));
  }
}
