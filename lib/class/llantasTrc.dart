import 'dart:convert';

LlantasTrac llantasTracFromJson(String str) =>
    LlantasTrac.fromJson(json.decode(str));

String llantasTracToJson(LlantasTrac data) => json.encode(data.toJson());

class LlantasTrac {
  LlantasTrac({
    this.llanta,
  });

  Map<String, Llanta> llanta;

  factory LlantasTrac.fromJson(Map<String, dynamic> json) => LlantasTrac(
        llanta: Map.from(json["llanta"])
            .map((k, v) => MapEntry<String, Llanta>(k, Llanta.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "llanta": Map.from(llanta)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Llanta {
  Llanta({
    this.llantaPos,
    this.marcaDescrip,
    this.descrip,
    this.llantaNumEco,
  });

  String llantaPos;
  String marcaDescrip;
  String descrip;
  String llantaNumEco;

  factory Llanta.fromJson(Map<String, dynamic> json) => Llanta(
        llantaPos: json["LLANTA_POS"],
        marcaDescrip: json["marca_descrip"],
        descrip: json["descrip"],
        llantaNumEco: json["llanta_num_eco"],
      );

  Map<String, dynamic> toJson() => {
        "LLANTA_POS": llantaPos,
        "marca_descrip": marcaDescrip,
        "descrip": descrip,
        "llanta_num_eco": llantaNumEco,
      };
}
