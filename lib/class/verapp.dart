import 'dart:convert';

VerApp verAppFromJson(String str) => VerApp.fromJson(json.decode(str));

String verAppToJson(VerApp data) => json.encode(data.toJson());

class VerApp {
  VerApp({
    this.the0,
    this.the1,
    this.the2,
    this.idVersin,
    this.nombreVersin,
    this.descripcion,
  });

  int the0;
  String the1;
  String the2;
  int idVersin;
  String nombreVersin;
  String descripcion;

  factory VerApp.fromJson(Map<String, dynamic> json) => VerApp(
        the0: json["0"],
        the1: json["1"],
        the2: json["2"],
        idVersin: json["id_versión"],
        nombreVersin: json["Nombre_versión"],
        descripcion: json["Descripcion"],
      );

  Map<String, dynamic> toJson() => {
        "0": the0,
        "1": the1,
        "2": the2,
        "id_versión": idVersin,
        "Nombre_versión": nombreVersin,
        "Descripcion": descripcion,
      };
}
