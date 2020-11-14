// To parse this JSON data, do
//
//     final ModelPedidos = ModelPedidosFromJson(jsonString);

import 'dart:convert';

ModelPedidos modelPedidosFromJson(String str) =>
    ModelPedidos.fromJson(json.decode(str));

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
    this.subplatillo,
  });

  List<Subplatillo> subplatillo;

  factory Platillo.fromJson(Map<String, dynamic> json) => Platillo(
        subplatillo: List<Subplatillo>.from(
            json["subplatillo"].map((x) => Subplatillo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subplatillo": List<dynamic>.from(subplatillo.map((x) => x.toJson())),
      };
}

class Subplatillo {
  Subplatillo({
    this.cantidad,
    this.precio,
    this.idRestaurante,
    this.idPlatillo,
  });

  int cantidad;
  int precio;
  String idRestaurante;
  String idPlatillo;

  factory Subplatillo.fromJson(Map<String, dynamic> json) => Subplatillo(
        cantidad: json["cantidad"],
        precio: json["precio"],
        idRestaurante: json["id_restaurante"],
        idPlatillo: json["id_platillo"],
      );

  Map<String, dynamic> toJson() => {
        "cantidad": cantidad,
        "precio": precio,
        "id_restaurante": idRestaurante,
        "id_platillo": idPlatillo,
      };
}

class Producto {
  Producto({
    this.subproducto,
  });

  List<Subproducto> subproducto;

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        subproducto: List<Subproducto>.from(
            json["subproducto"].map((x) => Subproducto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subproducto": List<dynamic>.from(subproducto.map((x) => x.toJson())),
      };
}

class Subproducto {
  Subproducto({
    this.cantidad,
    this.precio,
    this.idLocal,
    this.idProducto,
  });

  int cantidad;
  int precio;
  String idLocal;
  String idProducto;

  factory Subproducto.fromJson(Map<String, dynamic> json) => Subproducto(
        cantidad: json["cantidad"],
        precio: json["precio"],
        idLocal: json["id_local"],
        idProducto: json["id_producto"],
      );

  Map<String, dynamic> toJson() => {
        "cantidad": cantidad,
        "precio": precio,
        "id_local": idLocal,
        "id_producto": idProducto,
      };
}
