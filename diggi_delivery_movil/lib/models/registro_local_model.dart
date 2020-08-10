// To parse this JSON data, do
//
//     final RegistroLocalModel = RegistroLocalModelFromJson(jsonString);

import 'dart:convert';

//Recibe un Json en forma de String
RegistroLocalModel RegistroLocalModelFromJson(String str) =>
    RegistroLocalModel.fromJson(json.decode(str));

//Toma el modelo y lo genera a un JSon
String RegistroLocalModelToJson(RegistroLocalModel data) => json.encode(data.toJson());

class RegistroLocalModel {
  RegistroLocalModel({
    this.id,
    this.titulo = '',
    this.valor = 0.0,
    this.disponible = true,
    this.fotoUrl,
  });

  String id;
  String titulo;
  double valor;
  bool disponible;
  String fotoUrl;

  factory RegistroLocalModel.fromJson(Map<String, dynamic> json) => RegistroLocalModel(
        id: json["id"],
        titulo: json["titulo"],
        valor: json["valor"],
        disponible: json["disponible"],
        fotoUrl: json["fotoUrl"],
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        "titulo": titulo,
        "valor": valor,
        "disponible": disponible,
        "fotoUrl": fotoUrl,
      };
}
