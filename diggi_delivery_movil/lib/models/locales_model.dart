// To parse this JSON data, do
import 'dart:convert';
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
    this.pass,
  });

  String id;
  String nombre;
  String telefono;
  String email;
  String foto;
  String direccion;
  String latitud;
  String longitud;
  String pass;

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
        "direccion": direccion,
        "latitud": latitud,
        "longitud": longitud,
      };
}
