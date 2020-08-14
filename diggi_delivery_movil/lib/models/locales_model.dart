// To parse this JSON data, do
import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

//Recibe un Json en forma de String
RegistroLocalModel registroLocalModelFromJson(String str) =>
    RegistroLocalModel.fromFirestore(json.decode(str));

//Toma el modelo y lo genera a un JSon
String registroLocalModelToJson(RegistroLocalModel data) => json.encode(data.toMap());

class RegistroLocalModel {
  RegistroLocalModel({
    this.id,
    this.nombre,
    this.telefono,
    this.email,
    this.foto,
    this.direccion,
    this.latitud,
    this.longitud,
  });

  String id;
  String nombre;
  int telefono;
  String email;
  String foto;
  String direccion;
  String latitud;
  String longitud;

  factory RegistroLocalModel.fromFirestore(Map<String, dynamic> json) => RegistroLocalModel(
        id: json["id"],
        nombre: json["nombre"],
        telefono: json["telefono"],
        email: json["email"],
        foto: json["foto"],
        direccion: json["direccion"],
        latitud: json["latitud"],
        longitud: json["longitud"],
      );

  Map<String, dynamic> toMap() => {
        // "id": id,
        "nombre": nombre,
        "telefono": telefono,
        "email": email,
        "foto": foto,
        "direccion": foto,
        "latitud": latitud,
        "longitud": longitud,
      };
}
