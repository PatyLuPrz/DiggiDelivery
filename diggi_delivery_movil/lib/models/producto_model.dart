// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';

ProductoModel productoModelFromJson(String str) => ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
    ProductoModel({
        this.descripcion,
        this.foto,
        this.local,
        this.marca,
        this.nombre,
    });

    Descripcion descripcion;
    String foto;
    String local;
    String marca;
    String nombre;

    factory ProductoModel.fromJson(Map<String, dynamic> json) => ProductoModel(
        descripcion: Descripcion.fromJson(json["descripcion"]),
        foto: json["foto"],
        local: json["local"],
        marca: json["marca"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "descripcion": descripcion.toJson(),
        "foto": foto,
        "local": local,
        "marca": marca,
        "nombre": nombre,
    };
}

class Descripcion {
    Descripcion({
        this.cantidadDisponible,
        this.precio,
        this.presentacion,
    });

    int cantidadDisponible;
    int precio;
    String presentacion;

    factory Descripcion.fromJson(Map<String, dynamic> json) => Descripcion(
        cantidadDisponible: json["cantidad_disponible"],
        precio: json["precio"],
        presentacion: json["presentacion"],
    );

    Map<String, dynamic> toJson() => {
        "cantidad_disponible": cantidadDisponible,
        "precio": precio,
        "presentacion": presentacion,
    };
}
