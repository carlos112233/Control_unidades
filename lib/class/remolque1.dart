// To parse this JSON data, do
//
//     final rem1 = rem1FromJson(jsonString);

// To parse this JSON data, do
//
//     final remolque1 = remolque1FromJson(jsonString);

import 'dart:convert';

Remolque1 remolque1FromJson(String str) => Remolque1.fromJson(json.decode(str));

String remolque1ToJson(Remolque1 data) => json.encode(data.toJson());

class Remolque1 {
  Remolque1({
    this.rem1,
  });

  Rem1 rem1;

  factory Remolque1.fromJson(Map<String, dynamic> json) => Remolque1(
        rem1: Rem1.fromJson(json["rem1"]),
      );

  Map<String, dynamic> toJson() => {
        "rem1": rem1.toJson(),
      };
}

class Rem1 {
  Rem1({
    this.placas,
    this.llantas,
  });

  Placas placas;
  List<Llanta> llantas;

  factory Rem1.fromJson(Map<String, dynamic> json) => Rem1(
        placas: Placas.fromJson(json["placas"]),
        llantas:
            List<Llanta>.from(json["llantas"].map((x) => Llanta.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "placas": placas.toJson(),
        "llantas": List<dynamic>.from(llantas.map((x) => x.toJson())),
      };
}

class Llanta {
  Llanta({
    this.llantaNumEco,
    this.marcaDescrip,
    this.descripcion,
  });

  String llantaNumEco;
  String marcaDescrip;
  String descripcion;

  factory Llanta.fromJson(Map<String, dynamic> json) => Llanta(
        llantaNumEco: json["llanta_num_eco"],
        marcaDescrip: json["marca_descrip"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toJson() => {
        "llanta_num_eco": llantaNumEco,
        "marca_descrip": marcaDescrip,
        "descripcion": descripcion,
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
