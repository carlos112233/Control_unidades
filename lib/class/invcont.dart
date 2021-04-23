import 'dart:convert';

InvCont invContFromJson(String str) => InvCont.fromJson(json.decode(str));

String invContToJson(InvCont data) => json.encode(data.toJson());

class InvCont {
  InvCont({
    this.numInv,
    this.invEstado,
    this.numConteo,
    this.conEstado,
    this.fchInicio,
    this.fchCierre,
  });

  int numInv;
  String invEstado;
  String numConteo;
  String conEstado;
  FchInicio fchInicio;
  dynamic fchCierre;

  factory InvCont.fromJson(Map<String, dynamic> json) => InvCont(
        numInv: json["num_inv"],
        invEstado: json["inv_estado"],
        numConteo: json["num_conteo"],
        conEstado: json["con_estado"],
        fchInicio: FchInicio.fromJson(json["fch_inicio"]),
        fchCierre: json["fch_cierre"],
      );

  Map<String, dynamic> toJson() => {
        "num_inv": numInv,
        "inv_estado": invEstado,
        "num_conteo": numConteo,
        "con_estado": conEstado,
        "fch_inicio": fchInicio.toJson(),
        "fch_cierre": fchCierre,
      };
}

class FchInicio {
  FchInicio({
    this.date,
    this.timezoneType,
    this.timezone,
  });

  DateTime date;
  int timezoneType;
  String timezone;

  factory FchInicio.fromJson(Map<String, dynamic> json) => FchInicio(
        date: DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "timezone_type": timezoneType,
        "timezone": timezone,
      };
}
