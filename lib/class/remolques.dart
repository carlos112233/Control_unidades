// To parse this JSON data, do
//
//     final remolques = remolquesFromJson(jsonString);

import 'dart:convert';

Remolques remolquesFromJson(String str) => Remolques.fromJson(json.decode(str));

String remolquesToJson(Remolques data) => json.encode(data.toJson());

class Remolques {
  Remolques({
    this.rem1,
    this.rem2,
  });

  Rem1 rem1;
  Rem2 rem2;

  factory Remolques.fromJson(Map<String, dynamic> json) => Remolques(
        rem1: Rem1.fromJson(json["rem1"]),
        rem2: Rem2.fromJson(json["rem2"]),
      );

  Map<String, dynamic> toJson() => {
        "rem1": rem1.toJson(),
        "rem2": rem2.toJson(),
      };
}

class Rem1 {
  Rem1({
    this.the0,
    this.placas,
  });

  The0 the0;
  Rem1Placas placas;

  factory Rem1.fromJson(Map<String, dynamic> json) => Rem1(
        the0: The0.fromJson(json["0"]),
        placas: Rem1Placas.fromJson(json["placas"]),
      );

  Map<String, dynamic> toJson() => {
        "0": the0.toJson(),
        "placas": placas.toJson(),
      };
}

class Rem1Placas {
  Rem1Placas({
    this.the0,
    this.placa1,
  });

  String the0;
  String placa1;

  factory Rem1Placas.fromJson(Map<String, dynamic> json) => Rem1Placas(
        the0: json["0"],
        placa1: json["placa1"],
      );

  Map<String, dynamic> toJson() => {
        "0": the0,
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

class Rem2 {
  Rem2({
    this.the0,
    this.placas,
  });

  The0 the0;
  Rem2Placas placas;

  factory Rem2.fromJson(Map<String, dynamic> json) => Rem2(
        the0: The0.fromJson(json["0"]),
        placas: Rem2Placas.fromJson(json["placas"]),
      );

  Map<String, dynamic> toJson() => {
        "0": the0.toJson(),
        "placas": placas.toJson(),
      };
}

class Rem2Placas {
  Rem2Placas({
    this.the0,
    this.placa2,
  });

  String the0;
  String placa2;

  factory Rem2Placas.fromJson(Map<String, dynamic> json) => Rem2Placas(
        the0: json["0"],
        placa2: json["placa2"],
      );

  Map<String, dynamic> toJson() => {
        "0": the0,
        "placa2": placa2,
      };
}
