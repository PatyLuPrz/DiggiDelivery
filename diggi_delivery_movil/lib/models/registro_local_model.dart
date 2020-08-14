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
    this.nombre = '',
    this.telefono = 0.0,
    this.email = true,
    this.foto,
    this.direccion = '',
    this.coordenas,
  });

  String id;
  String nombre;
  double telefono;
  bool email;
  String foto;
  String direccion;
  LatLng coordenas;

  factory RegistroLocalModel.fromFirestore(Map<String, dynamic> json) => RegistroLocalModel(
        id: json["id"],
        nombre: json["nombre"],
        telefono: json["telefono"],
        email: json["email"],
        foto: json["foto"],
        direccion: json["direccion"],
        coordenas: json["coordenas"],
      );

  Map<String, dynamic> toMap() => {
        // "id": id,
        "nombre": nombre,
        "telefono": telefono,
        "email": email,
        "foto": foto,
        "direccion": foto,
        "coordenas": foto,
      };
}
