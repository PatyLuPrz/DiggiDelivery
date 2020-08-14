// To parse this JSON data, do
import 'dart:convert';

//Recibe un Json en forma de String
ModelUsuarios modelUsuariosFromJson(String str) =>
    ModelUsuarios.fromFirestore(json.decode(str));

//Toma el modelo y lo genera a un JSon
String modelUsuariosToJson(ModelUsuarios data) => json.encode(data.toMap());

class ModelUsuarios {
  ModelUsuarios({
    this.email,
    this.nivel,
  });

  String email;
  String nivel;

  factory ModelUsuarios.fromFirestore(Map<String, dynamic> json) =>
      ModelUsuarios(
        email: json["email"],
        nivel: json["nivel"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "nivel": nivel,
      };
}
