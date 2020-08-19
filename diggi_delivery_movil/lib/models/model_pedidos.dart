// To parse this JSON data, do
//
//     final ModelPedidos = ModelPedidosFromJson(jsonString);

import 'dart:convert';

ModelPedidos modelPedidosFromJson(String str) => ModelPedidos.fromJson(json.decode(str));

String modelPedidosToJson(ModelPedidos data) => json.encode(data.toJson());

class ModelPedidos {
  ModelPedidos({
    this.idPedido,
    this.cliente,
    this.platillo,
    this.proceso,
    this.producto,
    this.total,
  });

  String idPedido;
  String cliente;
  Platillo platillo;
  int proceso;
  Producto producto;
  int total;

  factory ModelPedidos.fromJson(Map<String, dynamic> json) => ModelPedidos(
        idPedido: json["id_pedido"],
        cliente: json["cliente"],
        platillo: Platillo.fromJson(json["platillo"]),
        proceso: json["proceso"],
        producto: Producto.fromJson(json["producto"]),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "id_pedido": idPedido,
        "cliente": cliente,
        "platillo": platillo.toJson(),
        "proceso": proceso,
        "producto": producto.toJson(),
        "total": total,
      };
}

class Platillo {
  Platillo({
    this.cantidad,
    this.correoRestaurante,
    this.idPlatillo,
  });

  int cantidad;
  String correoRestaurante;
  String idPlatillo;

  factory Platillo.fromJson(Map<String, dynamic> json) => Platillo(
        cantidad: json["cantidad"],
        correoRestaurante: json["correo_restaurante"],
        idPlatillo: json["id_platillo"],
      );

  Map<String, dynamic> toJson() => {
        "cantidad": cantidad,
        "correo_restaurante": correoRestaurante,
        "id_platillo": idPlatillo,
      };
}

class Producto {
  Producto({
    this.cantidad,
    this.correoLocal,
    this.idProducto,
  });

  int cantidad;
  String correoLocal;
  String idProducto;

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        cantidad: json["cantidad"],
        correoLocal: json["correo_local"],
        idProducto: json["id_producto"],
      );

  Map<String, dynamic> toJson() => {
        "cantidad": cantidad,
        "correo_local": correoLocal,
        "id_producto": idProducto,
      };
}
