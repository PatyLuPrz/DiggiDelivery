// To parse this JSON data, do
import 'dart:convert';

//Recibe un Json en forma de String
ClienteModel clienteModelFromJson(String str) =>
    ClienteModel.fromFirestore(json.decode(str));

//Toma el modelo y lo genera a un JSon
String clienteModelToJson(ClienteModel data) => json.encode(data.toMap());

class ClienteModel {
  ClienteModel({
    this.id,
    this.nombre,
    this.telefono,
    this.email,
    this.foto,
    this.direccion,
    this.pass,
  });

  String id;
  String nombre;
  int telefono;
  String email;
  String foto;
  String direccion;
  String latitud;
  String longitud;
  String pass;

  factory ClienteModel.fromFirestore(Map<String, dynamic> json) => ClienteModel(
        id: json["id"],
        nombre: json["nombre"],
        telefono: json["telefono"],
        email: json["email"],
        foto: json["foto"],
        direccion: json["direccion"],
      );

  Map<String, dynamic> toMap() => {
        // "id": id,
        "nombre": nombre,
        "telefono": telefono,
        "email": email,
        "foto": foto,
        "direccion": direccion,
      };
}
