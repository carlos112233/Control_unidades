import 'dart:convert';

Mensaje1 mensajecodeFromJson(String str) => Mensaje1.fromJson(json.decode(str));

String mensajecodeToJson(Mensaje1 data) => json.encode(data.toJson());

class Mensaje1 {
  Mensaje1({
    this.mesaje,
  });

  String mesaje;

  factory Mensaje1.fromJson(Map<String, dynamic> json) => Mensaje1(
        mesaje: json["mensaje"],
      );

  Map<String, dynamic> toJson() => {
        "mensaje": mesaje,
      };
}
