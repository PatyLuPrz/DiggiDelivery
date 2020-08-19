import 'dart:io';

import 'package:diggi_delivery_movil/models/archivos_model.dart';
import 'package:rxdart/rxdart.dart';

class ArchivosBloc {
  //Streamcontroller
  final _productosController = new BehaviorSubject<String>();
  final _cargandoController = new BehaviorSubject<bool>();

  //Referencia para realizar la petición a cada proceso
  final _productoProvider = new ArchivosModel();

  //Escuchar streams
  Stream<String> get productosStream => _productosController.stream;
  Stream<bool> get cargando => _cargandoController.stream;

  //Subir foto
  Future<String> subirFoto(File foto) async {
    final fotoUrl = await _productoProvider.subirImagen(foto);

    return fotoUrl;
  }

  dispose() {
    _cargandoController.close();
    _productosController.close();
  }
}
