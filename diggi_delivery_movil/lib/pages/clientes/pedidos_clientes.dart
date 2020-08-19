import 'package:diggi_delivery_movil/blocs/pages/provider.dart';
import 'package:diggi_delivery_movil/helpers/theme.dart';
import 'package:diggi_delivery_movil/models/model_pedidos.dart';
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
    final pedidosBloc = Provider.pedidosBloc(context);
    pedidosBloc.cargarPedidos();

    PedidosProvider pedidosProvider = PedidosProvider();
    pedidosProvider.getPedidos();

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
          return girdView(pedidos, context);
        },
      ),
    );
  }

  Widget girdView(List<ModelPedidos> pedidos, BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemCount: pedidos.length,
      itemBuilder: (context, index) {
        return transformTraslate(index, pedidos);
      },
    );
  }

  _textPedidoCard(int index, List<ModelPedidos> pedidos) {
    return ListTile(
      title: Text(
        // '${platillos.documents[index].data['nombre']}',
        '#${pedidos[index].producto.idProducto}',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
      ),
    );
  }

  Widget transformTraslate(int index, List<ModelPedidos> pedidos) {
    return Transform.translate(
      offset: Offset(0.0, 0.0),
      child: InkWell(
        key: UniqueKey(),
        // onTap: () => Navigator.pushNamed(
        //         context, PlatilloInformacion.routeName,
        //         arguments: platillos.documents[index].data)
        //     .then((value) => setState(() {})),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.black12)),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: _textPedidoCard(index, pedidos),
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
}
