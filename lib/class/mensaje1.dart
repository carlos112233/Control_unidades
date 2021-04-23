import 'dart:convert';

Mensaje1 mensaje1FromJson(String str) => Mensaje1.fromJson(json.decode(str));

String mensaje1ToJson(Mensaje1 data) => json.encode(data.toJson());

class Mensaje1 {
  Mensaje1({
    this.mesaje,
  });

  String mesaje;

  factory Mensaje1.fromJson(Map<String, dynamic> json) => Mensaje1(
        mesaje: json["mesaje"],
      );

  Map<String, dynamic> toJson() => {
        "mesaje": mesaje,
      };
}
