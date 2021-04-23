// To parse this JSON data, do
//
//     final mensaje = mensajeFromJson(jsonString);

import 'dart:convert';

Mensaje mensajeFromJson(String str) => Mensaje.fromJson(json.decode(str));

String mensajeToJson(Mensaje data) => json.encode(data.toJson());

class Mensaje {
  Mensaje({
    this.the0,
    this.mesaje,
  });

  The0 the0;
  String mesaje;

  factory Mensaje.fromJson(Map<String, dynamic> json) => Mensaje(
        the0: The0.fromJson(json["0"]),
        mesaje: json["mesaje"],
      );

  Map<String, dynamic> toJson() => {
        "0": the0.toJson(),
        "mesaje": mesaje,
      };
}

class The0 {
  The0({
    this.conteo,
    this.inventario,
  });

  String conteo;
  int inventario;

  factory The0.fromJson(Map<String, dynamic> json) => The0(
        conteo: json["conteo"],
        inventario: json["inventario"],
      );

  Map<String, dynamic> toJson() => {
        "conteo": conteo,
        "inventario": inventario,
      };
}
