// To parse this JSON data, do
import 'dart:convert';

//Recibe un Json en forma de String
ProductoModel roductoModelFromJson(String str) =>
    ProductoModel.fromFirestore(json.decode(str));

//Toma el modelo y lo genera a un JSon
String productoModelToJson(ProductoModel data) => json.encode(data.toMap());

class ProductoModel {
  ProductoModel({
    this.id,
    this.nombre,
    this.marca,
    this.local,
    this.foto,
    this.presentacion,
    this.precio = 0,
    this.cantidadDisponible,
    this.descripcion,
  });

  String id;
  String nombre;
  String marca;
  String local;
  String foto;
  String presentacion;
  int precio;
  int cantidadDisponible;

  Map<String, dynamic> descripcion;

  factory ProductoModel.fromFirestore(Map<String, dynamic> json) =>
      ProductoModel(
        // descripcion: json["descripcion"],
        nombre: json["nombre"],
        marca: json["marca"],
        local: json["local"],
        foto: json["foto"],
        descripcion: Map<String, dynamic>.from(json["descripcion"]),
      );

  Map<String, dynamic> toMap() => {
        // "id": id,
        "nombre": nombre,
        "marca": marca,
        "local": local,
        "foto": foto,
        "descripcion": precio,
        // "descripcion": Map<String, dynamic>.from(descripcion.addAll({'value': cantidad_disponible})),
        // "descripcion": descripcion,
      };
}
