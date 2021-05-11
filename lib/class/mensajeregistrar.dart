import 'dart:convert';

Registrar registrarFromJson(String str) => Registrar.fromJson(json.decode(str));

String registrarToJson(Registrar data) => json.encode(data.toJson());

class Registrar {
  Registrar({
    this.mensaje,
  });

  String mensaje;

  factory Registrar.fromJson(Map<String, dynamic> json) => Registrar(
        mensaje: json["mensaje"],
      );

  Map<String, dynamic> toJson() => {
        "mensaje": mensaje,
      };
}
