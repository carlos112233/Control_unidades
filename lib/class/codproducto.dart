import 'dart:convert';

Producto productoFromJson(String str) => Producto.fromJson(json.decode(str));

String productoToJson(Producto data) => json.encode(data.toJson());

class Producto {
  Producto({
    this.id,
    this.productoClave,
    this.productoDescrip,
    this.indice,
    this.usrMod,
    this.codigoBarra,
    this.unidadClave,
  });

  String id;
  String productoClave;
  String productoDescrip;
  int indice;
  String usrMod;
  String codigoBarra;
  String unidadClave;

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        id: json["id"],
        productoClave: json["producto_clave"],
        productoDescrip: json["producto_descrip"],
        indice: json["indice"],
        usrMod: json["usr_mod"],
        codigoBarra: json["codigo_barra"],
        unidadClave: json["unidad_clave"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "producto_clave": productoClave,
        "producto_descrip": productoDescrip,
        "indice": indice,
        "usr_mod": usrMod,
        "codigo_barra": codigoBarra,
        "unidad_clave": unidadClave,
      };
}
