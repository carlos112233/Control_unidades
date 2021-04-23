// To parse this JSON data, do
//
//     final rem1 = rem1FromJson(jsonString);

import 'dart:convert';

Rem1 rem1FromJson(String str) => Rem1.fromJson(json.decode(str));

String rem1ToJson(Rem1 data) => json.encode(data.toJson());

class Rem1 {
  Rem1({
    this.rem1,
  });

  Rem1Class rem1;

  factory Rem1.fromJson(Map<String, dynamic> json) => Rem1(
        rem1: Rem1Class.fromJson(json["rem1"]),
      );

  Map<String, dynamic> toJson() => {
        "rem1": rem1.toJson(),
      };
}

class Rem1Class {
  Rem1Class({
    this.the0,
    this.placas,
  });

  The0 the0;
  Placas placas;

  factory Rem1Class.fromJson(Map<String, dynamic> json) => Rem1Class(
        the0: The0.fromJson(json["0"]),
        placas: Placas.fromJson(json["placas"]),
      );

  Map<String, dynamic> toJson() => {
        "0": the0.toJson(),
        "placas": placas.toJson(),
      };
}

class Placas {
  Placas({
    this.placa1,
  });

  String placa1;

  factory Placas.fromJson(Map<String, dynamic> json) => Placas(
        placa1: json["placa1"],
      );

  Map<String, dynamic> toJson() => {
        "placa1": placa1,
      };
}

class The0 {
  The0({
    this.llantas,
  });

  List<Llanta> llantas;

  factory The0.fromJson(Map<String, dynamic> json) => The0(
        llantas:
            List<Llanta>.from(json["llantas"].map((x) => Llanta.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "llantas": List<dynamic>.from(llantas.map((x) => x.toJson())),
      };
}

class Llanta {
  Llanta({
    this.llantaPos,
    this.marcaDescrip,
    this.descripcion,
  });

  String llantaPos;
  String marcaDescrip;
  String descripcion;

  factory Llanta.fromJson(Map<String, dynamic> json) => Llanta(
        llantaPos: json["LLANTA_POS"],
        marcaDescrip: json["marca_descrip"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toJson() => {
        "LLANTA_POS": llantaPos,
        "marca_descrip": marcaDescrip,
        "descripcion": descripcion,
      };
}
