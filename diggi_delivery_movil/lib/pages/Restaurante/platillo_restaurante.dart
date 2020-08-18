import 'dart:io';

import 'package:diggi_delivery_movil/blocs/archivos_bloc.dart';
import 'package:diggi_delivery_movil/blocs/pages/provider.dart';
import 'package:diggi_delivery_movil/blocs/pages/restaurantes/restaurantes_bloc.dart';
import 'package:diggi_delivery_movil/models/platillo_model.dart';
import 'package:diggi_delivery_movil/shared_prefs/preferencias_usuario.dart';
import 'package:diggi_delivery_movil/widgets/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PlatilloRestaurante extends StatefulWidget {
  static final routeName = "platilloRestaurante";
  @override
  _PlatilloRestauranteState createState() => _PlatilloRestauranteState();
}

class _PlatilloRestauranteState extends State<PlatilloRestaurante> {
  //Key de los widget para evaluar las acciones a realizar
  final formKey = GlobalKey<FormState>();
  final prefs = new PreferenciasUsuario();
  PlatillosModel _platillosModel = PlatillosModel();
  RestaurantesBloc _platilloRestaurante;
  ArchivosBloc _archivosBloc = new ArchivosBloc();
  RestaurantesBloc _restaurantesBloc = RestaurantesBloc();
  final picker = ImagePicker();
  File foto;
  bool _guardando = false;
  String id;

  @override
  Widget build(BuildContext context) {
    _platilloRestaurante = Provider.restaurantesBloc(context);
    final Map<String, dynamic> platillosData =
        ModalRoute.of(context).settings.arguments;
    if (platillosData != null) {
      platillosData.forEach((key, value) {
        _platillosModel = PlatillosModel.fromFirestore(platillosData);
      });
      id = _platillosModel.restaurante;
      print(id);
    }
    print(id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC93F42),
        title: Text('Platillo'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.photo_size_select_actual),
              onPressed: _seleccionarFoto),
          IconButton(icon: Icon(Icons.camera_alt), onPressed: _tomarFoto),
        ],
      ),
      body: SingleChildScrollView(
        child:
            _formularioPlatillo(context, _platilloRestaurante, _platillosModel),
      ),
    );
  }

  Widget _formularioPlatillo(BuildContext context,
      RestaurantesBloc platilloRestaurante, PlatillosModel platillosModel) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            _card(platillosModel),
            SizedBox(height: 10.0),
            _crearNombre(platillosModel),
            SizedBox(height: 15.0),
            _crearDescripcion(platillosModel),
            SizedBox(height: 15.0),
            _ingredientesExtra(platillosModel),
            SizedBox(height: 15.0),
            _crearPrecio(platillosModel),
            SizedBox(height: 15.0),
            _tiempoDePreparacion(platillosModel),
            SizedBox(height: 15.0),
            _crearBoton(platillosModel),
            SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }

  Widget _crearNombre(PlatillosModel platillosData) {
    final dec = DecorationInputForm(
        textLabel: "Nombre del platillo",
        textHint: "Pizza hawuaiana",
        icon: Icons.fastfood);
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.text,
        initialValue: platillosData.nombre,
        enabled: true,
        decoration: dec.decoration(),
        onChanged: (value) => _platillosModel.nombre = value,
      ),
    );
  }

  Widget _crearDescripcion(PlatillosModel platillosData) {
    final dec = DecorationInputForm(
        textLabel: "Descripción",
        textHint: "Pizza hawuaiana con queso...",
        icon: Icons.copyright);
    return Container(
      child: TextFormField(
        maxLines: null,
        keyboardType: TextInputType.multiline,
        initialValue: platillosData.descripcion,
        enabled: true,
        decoration: dec.decoration(),
        onChanged: (value) => _platillosModel.descripcion = value,
      ),
    );
  }

  Widget _ingredientesExtra(PlatillosModel platillosData) {
    final dec = DecorationInputForm(
        textLabel: "Ingredientes extra",
        textHint: "Extra queso, extra piña...",
        icon: Icons.view_list);
    return Container(
      child: TextFormField(
          keyboardType: TextInputType.text,
          initialValue: platillosData.ingredientes?.toString() ?? '',
          enabled: true,
          decoration: dec.decoration(),
          onChanged: (value) =>
              _platillosModel.ingredientes = value.split(',')),
    );
  }

  Widget _crearPrecio(PlatillosModel platillosData) {
    final dec = DecorationInputForm(
        textLabel: "Precio de platillo",
        textHint: "100.0",
        icon: Icons.attach_money);
    return TextFormField(
        keyboardType: TextInputType.numberWithOptions(decimal: false),
        // initialValue: platillosData.data['precio'].toString(),
        initialValue: platillosData.precio.toString(),
        decoration: dec.decoration(),
        onChanged: (value) => _platillosModel.precio = int.parse(value));
  }

  Widget _tiempoDePreparacion(PlatillosModel platillosData) {
    final dec = DecorationInputForm(
        textLabel: "Tiempo de preparación",
        textHint: "30 minutos",
        icon: Icons.storage);
    return TextFormField(
        keyboardType: TextInputType.text,
        initialValue: platillosData.tiempoPreparacion,
        decoration: dec.decoration(),
        onChanged: (value) => _platillosModel.tiempoPreparacion = value);
  }

  Widget _card(PlatillosModel platillosModel) {
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
          _mostrarFoto(platillosModel),
        ],
      ),
    );
  }

  Widget _mostrarFoto(PlatillosModel platillosModel) {
    if (platillosModel.foto != null) {
      return FadeInImage(
        width: double.infinity,
        placeholder: AssetImage('assets/img/jar-loading.gif'),
        image: NetworkImage(platillosModel.foto),
        height: 180,
        fit: BoxFit.fill,
      );
    } else {
      return Image(
        image: AssetImage(foto?.path ?? 'assets/img/no-image.png'),
        fit: BoxFit.cover,
      );
    }
  }

  void _seleccionarFoto() async {
    _procesarImagen(ImageSource.gallery);
  }

  void _tomarFoto() async {
    _procesarImagen(ImageSource.camera);
  }

  _procesarImagen(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    if (foto != null) {
      _platillosModel.foto = null;
    }

    setState(() {
      foto = File(pickedFile.path);
    });
  }

  Widget _crearBoton(PlatillosModel platillosData) {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Color(0xFFC93F42),
      textColor: Colors.white,
      label: Text('Guardar platillo'),
      icon: Icon(Icons.save),
      onPressed: (_guardando) ? null : _submit,
    );
  }

  void _submit() async {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();

    setState(() {
      _guardando = true;
      print(prefs.idUpdateRegistro);
      print(_platillosModel.tiempoPreparacion);
      print(_platillosModel.restaurante = id);
      print(_platillosModel.precio);
      print(_platillosModel.nombre);
      print(_platillosModel.ingredientes);
      print(_platillosModel.descripcion);
      print(prefs.idUpdateRegistro);
    });

    if (foto != null) {
      _platillosModel.foto = await _archivosBloc.subirFoto(foto);
      print(_platillosModel.foto);
    }

    if (id == null) {
      _platillosModel.restaurante = prefs.idRestaurante;
      _restaurantesBloc.agregarProducto(_platillosModel);
    }
    // _productosBloc.editarProducto(_platillosModel);
    // }
    // _guardando = false;
    // mostrarSnackbar('Registro guardado');

    Navigator.pop(context);
    _guardando = false;
  }

  // void mostrarSnackbar(String mensaje) {
  //   final snackbar = SnackBar(
  //     content: Text(mensaje),
  //     duration: Duration(milliseconds: 1500),
  //   );

  // scaffoldKey.currentState.showSnackBar(snackbar);
  // }
}
