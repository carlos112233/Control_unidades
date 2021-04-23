// To parse this JSON data, do
//
//     final dolly = dollyFromJson(jsonString);

import 'dart:convert';

Dolly dollyFromJson(String str) => Dolly.fromJson(json.decode(str));

String dollyToJson(Dolly data) => json.encode(data.toJson());

class Dolly {
  Dolly({
    this.llantas,
  });

  List<Llanta> llantas;

  factory Dolly.fromJson(Map<String, dynamic> json) => Dolly(
        llantas:
            List<Llanta>.from(json["Llantas"].map((x) => Llanta.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Llantas": List<dynamic>.from(llantas.map((x) => x.toJson())),
      };
}

class Llanta {
  Llanta({
    this.the0,
    this.the1,
    this.the2,
    this.llantaNumEco,
    this.marcaDescrip,
    this.descripcion,
  });

  String the0;
  String the1;
  String the2;
  String llantaNumEco;
  String marcaDescrip;
  String descripcion;

  factory Llanta.fromJson(Map<String, dynamic> json) => Llanta(
        the0: json["0"],
        the1: json["1"],
        the2: json["2"],
        llantaNumEco: json["llanta_num_eco"],
        marcaDescrip: json["marca_descrip"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toJson() => {
        "0": the0,
        "1": the1,
        "2": the2,
        "llanta_num_eco": llantaNumEco,
        "marca_descrip": marcaDescrip,
        "descripcion": descripcion,
      };
}
