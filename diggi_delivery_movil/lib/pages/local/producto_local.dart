import 'dart:io';

import 'package:diggi_delivery_movil/blocs/archivos_bloc.dart';
import 'package:diggi_delivery_movil/blocs/pages/locales/locales_bloc.dart';
import 'package:diggi_delivery_movil/blocs/pages/provider.dart';
import 'package:diggi_delivery_movil/blocs/pages/restaurantes/restaurantes_bloc.dart';
import 'package:diggi_delivery_movil/models/platillo_model.dart';
import 'package:diggi_delivery_movil/models/producto_model.dart';
import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart';
import 'package:diggi_delivery_movil/widgets/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductoLocal extends StatefulWidget {
  static final routeName = "ProductoLocal";
  @override
  _ProductoLocalState createState() => _ProductoLocalState();
}

class _ProductoLocalState extends State<ProductoLocal>
    with WidgetsBindingObserver {
  //Key de los widget para evaluar las acciones a realizar
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final prefs = new PreferenciasUsuario();
  ProductoModel _productoModel = ProductoModel();
  LocalesBloc _productoBloc;
  ArchivosBloc _archivosBloc = ArchivosBloc();
  final picker = ImagePicker();
  File foto;
  bool _guardando = false;
  bool registro = false;
  bool nuevoPath = false;

  String id;

  @override
  Widget build(BuildContext context) {
    _productoBloc = Provider.localesBloc(context);
    final Map<String, dynamic> platillosData =
        ModalRoute.of(context).settings.arguments;
    if (platillosData != null) {
      platillosData.forEach((key, value) {
        _productoModel = ProductoModel.fromJson(platillosData);
      });
      id = _productoModel.local;
      registro = true;
    }
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFC93F42),
        title: Text('Producto'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.photo_size_select_actual),
              onPressed: () {
                _seleccionarFoto(_productoModel);
              }),
          IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {
                _tomarFoto(_productoModel);
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: _formularioPlatillo(context, _productoBloc, _productoModel),
      ),
    );
  }

  Widget _formularioPlatillo(BuildContext context, LocalesBloc productoLocal,
      ProductoModel productoModel) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            _card(productoModel),
            SizedBox(height: 10.0),
            _crearNombre(productoModel),
            SizedBox(height: 15.0),
            _crearMarca(productoModel),
            SizedBox(height: 15.0),
            _crearPresentacion(productoModel),
            SizedBox(height: 15.0),
            _crearPrecio(productoModel),
            SizedBox(height: 15.0),
            _cantidad(productoModel),
            SizedBox(height: 15.0),
            _crearBoton(productoModel),
            SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }

  Widget _crearNombre(ProductoModel productoModel) {
    final dec = DecorationInputForm(
        textLabel: "Nombre de producto",
        textHint: "Lapicero",
        icon: Icons.shop);
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.text,
        initialValue: productoModel.nombre,
        enabled: true,
        decoration: dec.decoration(),
        onChanged: (value) => productoModel.nombre = value,
      ),
    );
  }

  Widget _crearMarca(ProductoModel productoModel) {
    final dec = DecorationInputForm(
        textLabel: "Marca de producto", textHint: "Bic", icon: Icons.copyright);
    return Container(
      child: TextFormField(
        maxLines: null,
        keyboardType: TextInputType.multiline,
        initialValue: productoModel.marca,
        enabled: true,
        decoration: dec.decoration(),
        onChanged: (value) => productoModel.marca = value,
      ),
    );
  }

  Widget _crearPresentacion(ProductoModel productoModel) {
    // final value = productoModel.nombre.toString();
    // final newValue = value.replaceAll("[", "").replaceAll("]", "");
    // print("value: $newValue");

    final dec = DecorationInputForm(
        textLabel: "Presentación", textHint: "10 ml", icon: Icons.view_list);
    return Container(
      child: TextFormField(
          keyboardType: TextInputType.text,
          initialValue: productoModel.descripcion?.presentacion ?? '',
          enabled: true,
          decoration: dec.decoration(),
          onChanged: (value) => productoModel.descripcion.presentacion = value),
    );
  }

  Widget _crearPrecio(ProductoModel productoModel) {
    final dec = DecorationInputForm(
        textLabel: "Precio", textHint: "10", icon: Icons.storage);
    return TextFormField(
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        initialValue: productoModel.descripcion?.precio?.toString() ?? '',
        decoration: dec.decoration(),
        onChanged: (value) =>
            productoModel.descripcion.precio = int.parse(value));
  }

  Widget _cantidad(ProductoModel productoModel) {
    final dec = DecorationInputForm(
        textLabel: "Cantidad disponible", textHint: "20", icon: Icons.storage);
    return TextFormField(
        keyboardType: TextInputType.text,
        initialValue:
            productoModel.descripcion?.cantidadDisponible?.toString() ?? '',
        decoration: dec.decoration(),
        onChanged: (value) =>
            productoModel.descripcion.cantidadDisponible = int.parse(value));
  }

  Widget _card(ProductoModel productoModel) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Introducir la información necesaria para agregar un nuevo producto",
              textAlign: TextAlign.center,
            ),
          ),
          _mostrarFoto(productoModel),
        ],
      ),
    );
  }

  Widget _mostrarFoto(ProductoModel productoModel) {
    // if (platillosModel.foto != null) {
    //   return FadeInImage(
    //     placeholder: AssetImage('assets/img/jar-loading.gif'),
    //     image: NetworkImage(platillosModel.foto),
    //     height: 250.0,
    //     fit: BoxFit.fill,
    //   );
    // } else {
    //   if (foto != null) {
    //     return Image.file(foto);
    //   }
    //   return Image.asset('assets/img/no-image.png');
    // }
    print(productoModel.foto);
    if (productoModel.foto != null && registro && nuevoPath == false) {
      return FadeInImage(
        placeholder: AssetImage('assets/img/jar-loading.gif'),
        image: NetworkImage(productoModel.foto),
        height: 250.0,
        fit: BoxFit.fill,
      );
    } else {
      if (foto != null) {
        return Image(
          image: AssetImage(foto?.path ?? 'assets/img/no-image.png'),
          fit: BoxFit.contain,
        );
      }
      return Container();
    }
  }

  void _seleccionarFoto(ProductoModel productoModel) async {
    // _procesarImagen(ImageSource.gallery, platillosModel);

    var picture = await picker.getImage(source: ImageSource.gallery);
    if (picture != null) {
      foto = null;
      this.setState(() {
        productoModel.foto = '';
        nuevoPath = true;
        foto = File(picture.path);
      });
    }
    // Navigator.of(context).pop();
  }

  void _tomarFoto(ProductoModel productoModel) async {
    // _procesarImagen(ImageSource.camera, platillosModel);
    var picture = await picker.getImage(source: ImageSource.camera);
    if (picture != null) {
      foto = null;
      this.setState(() {
        productoModel.foto = '';
        nuevoPath = true;
        foto = File(picture.path);
      });
    }
    // Navigator.of(context).pop();
  }

  // _procesarImagen(ImageSource source, ProductoModel productoModel) async {
  //   final pickedFile = await picker.getImage(source: source);
  //   print(pickedFile);
  //   if (pickedFile != null) {
  //       foto = null;
  //     setState(() {
  //       productoModel.foto = '';
  //       nuevoPath = true;
  //       foto = File(pickedFile.path);
  //     });
  //   }
  // }

  Widget _crearBoton(ProductoModel productoModel) {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Color(0xFFC93F42),
      textColor: Colors.white,
      label: Text('Guardar producto'),
      icon: Icon(Icons.save),
      onPressed: (_guardando) ? null : _submit,
    );
  }

  void _submit() async {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();

    setState(() {
      _guardando = true;
    });

    if (foto != null) {
      prefs.fotoURLCrud = await _archivosBloc.subirFoto(foto);
      print(prefs.fotoURLCrud);
      _productoModel.foto = prefs.fotoURLCrud;
    }

    _productoModel.local = prefs.idRestaurante;
    if (id == null) {
      _productoBloc.agregarProducto(_productoModel);
    } else {
      _productoBloc.editarProducto(_productoModel);
    }

    Navigator.pop(context);
    _guardando = false;
  }
}
