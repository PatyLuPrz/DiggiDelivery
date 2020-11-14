// To parse this JSON data, do
import 'dart:convert';

//Recibe un Json en forma de String
PlatillosModel platillosModelFromJson(String str) =>
    PlatillosModel.fromFirestore(json.decode(str));

//Toma el modelo y lo genera a un JSon
String platillosModelToJson(PlatillosModel data) => json.encode(data.toMap());

class PlatillosModel {
  PlatillosModel({
    this.id,
    this.nombre,
    this.precio = 0,
    this.ingredientes,
    this.foto,
    this.descripcion,
    this.tiempoPreparacion,
    this.restaurante,

    this.cantidad = 0,
  });

  String id;
  String nombre;
  int precio;
  List<String> ingredientes;
  String foto;
  String descripcion;
  String tiempoPreparacion;
  String restaurante;

  int cantidad;

  factory PlatillosModel.fromFirestore(Map<String, dynamic> json) =>
      PlatillosModel(
        descripcion: json["descripcion"],
        foto: json["foto"],
        ingredientes:
            List<String>.from(json["ingredientes_extra"].map((x) => x)),
        nombre: json["nombre"],
        precio: json["precio"],
        restaurante: json["restaurante"],
        tiempoPreparacion: json["tiempo_preparacion"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        // "id": id,
        "nombre": nombre,
        "precio": precio,
        "ingredientes_extra": List<dynamic>.from(ingredientes.map((x) => x)),
        "foto": foto,
        "descripcion": descripcion,
        "tiempo_preparacion": tiempoPreparacion,
        "restaurante": restaurante,
      };
}
