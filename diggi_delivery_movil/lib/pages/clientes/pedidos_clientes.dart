import 'package:diggi_delivery_movil/blocs/pages/provider.dart';
import 'package:diggi_delivery_movil/helpers/theme.dart';
import 'package:diggi_delivery_movil/models/model_pedidos.dart';
import 'package:diggi_delivery_movil/pages/clientes/pedido_clientes_detalle.dart';
import 'package:diggi_delivery_movil/providers/pedidos_provider.dart';
import 'package:diggi_delivery_movil/widgets/timeline_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as prov;

class PedidosClientes extends StatefulWidget {
  final String nombre;

  const PedidosClientes({Key key, this.nombre}) : super(key: key);

  @override
  _PedidosClientesState createState() => _PedidosClientesState();
}

class _PedidosClientesState extends State<PedidosClientes> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final pedidosBloc = Provider.pedidosBloc(context);
    pedidosBloc.cargarPedidos();

    final currentTheme = prov.Provider.of<ThemeProvider>(context);
    return Scaffold(
      // backgroundColor: currentTheme.currentThemeColorComponents(currentTheme),
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromRGBO(49, 49, 49, 1.0)),
        title: Text(
          'Pedidos',
          style: TextStyle(color: Color.fromRGBO(49, 49, 49, 1.0)),
        ),
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder(
        stream: pedidosBloc.pedidosStream,
        builder:
            (BuildContext context, AsyncSnapshot<List<ModelPedidos>> snapshot) {
          final pedidos = snapshot.data;
          return girdView(pedidos, context, size);
        },
      ),
    );
  }

  Widget girdView(List<ModelPedidos> pedidos, BuildContext context, Size size) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemCount: pedidos?.length ?? 0,
      itemBuilder: (context, index) {
        return transformTraslate(index, pedidos, size);
      },
    );
  }

  Widget transformTraslate(int index, List<ModelPedidos> pedidos, Size size) {
    return Transform.translate(
      offset: Offset(0.0, 0.0),
      child: InkWell(
        key: UniqueKey(),
        onTap: () => Navigator.pushNamed(
                context, PedidoDetallesCliente.routeName,
                arguments: pedidos[index])
            .then((value) => setState(() {})),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.black12)),
            child: Stack(
              children: <Widget>[
                _imagenAvatar(size),
                containerBlack(),
                Align(
                  alignment: Alignment.topLeft,
                  child: _textPedidoCard(index, pedidos),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: _textPedidoPrecio(index, pedidos),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ScreenProgress(ticks: pedidos[index].proceso),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _textPedidoCard(int index, List<ModelPedidos> pedidos) {
    return ListTile(
      title: Text(
        // '${platillos.documents[index].data['nombre']}',
        '#${pedidos[index].idPedido}',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.white,
          fontStyle: FontStyle.italic,
          fontSize: 14.0,
        ),
      ),
    );
  }

  _textPedidoPrecio(int index, List<ModelPedidos> pedidos) {
    return ListTile(
      title: Text(
        // '${platillos.documents[index].data['nombre']}',
        '\$ ${pedidos[index].total.toString()} MXN',
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Colors.white,
          fontStyle: FontStyle.italic,
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget containerBlack() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.0),
          color: Color.fromRGBO(0, 0, 0, 0.3)),
    );
  }

  Widget _imagenAvatar(Size size) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.asset(
          'assets/img/cliente.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
