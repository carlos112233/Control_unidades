// To parse this JSON data, do
//
//     final historicoRev = historicoRevFromJson(jsonString);

import 'dart:convert';

HistoricoRev historicoRevFromJson(String str) =>
    HistoricoRev.fromJson(json.decode(str));

String historicoRevToJson(HistoricoRev data) => json.encode(data.toJson());

class HistoricoRev {
  HistoricoRev({
    this.idRevTrac,
    this.tractoEco,
    this.motivoIngreso,
    this.cabina,
    this.defensaDelantera,
    this.tanqueAire,
    this.motor,
    this.ejeImpulsor,
    this.pisoCabiba,
    this.quintaRueda,
    this.tanqueDiesel,
    this.escape,
    this.cmTIzq,
    this.cmTDer,
    this.capTanqueLtIzq,
    this.capTanqueLtDer,
    this.trampaIzq,
    this.trampaDer,
    this.aluminio,
    this.fierro,
    this.taponDieselDer,
    this.taponDieselIzq,
    this.fchaRev,
    this.estatus,
    this.placas,
    this.cp,
    this.usuario,
  });

  int idRevTrac;
  String tractoEco;
  String motivoIngreso;
  String cabina;
  String defensaDelantera;
  String tanqueAire;
  String motor;
  String ejeImpulsor;
  String pisoCabiba;
  String quintaRueda;
  String tanqueDiesel;
  String escape;
  String cmTIzq;
  String cmTDer;
  String capTanqueLtIzq;
  String capTanqueLtDer;
  String trampaIzq;
  String trampaDer;
  String aluminio;
  String fierro;
  String taponDieselDer;
  String taponDieselIzq;
  FchaRev fchaRev;
  String estatus;
  String placas;
  String cp;
  String usuario;

  factory HistoricoRev.fromJson(Map<String, dynamic> json) => HistoricoRev(
        idRevTrac: json["id_rev_trac"],
        tractoEco: json["tracto_eco"],
        motivoIngreso: json["motivo_ingreso"],
        cabina: json["cabina"],
        defensaDelantera: json["defensa_delantera"],
        tanqueAire: json["tanque_Aire"],
        motor: json["motor"],
        ejeImpulsor: json["eje_impulsor"],
        pisoCabiba: json["piso_cabiba"],
        quintaRueda: json["quinta_rueda"],
        tanqueDiesel: json["tanque_Diesel"],
        escape: json["escape"],
        cmTIzq: json["CM_T_Izq"],
        cmTDer: json["CM_T_Der"],
        capTanqueLtIzq: json["Cap_Tanque_LT_Izq"],
        capTanqueLtDer: json["Cap_Tanque_LT_Der"],
        trampaIzq: json["Trampa_Izq"],
        trampaDer: json["Trampa_Der"],
        aluminio: json["Aluminio"],
        fierro: json["Fierro"],
        taponDieselDer: json["Tapon_Diesel_Der"],
        taponDieselIzq: json["Tapon_Diesel_Izq"],
        fchaRev: FchaRev.fromJson(json["fcha_rev"]),
        estatus: json["estatus"],
        placas: json["placas"],
        cp: json["cp"],
        usuario: json["usuario"],
      );

  Map<String, dynamic> toJson() => {
        "id_rev_trac": idRevTrac,
        "tracto_eco": tractoEco,
        "motivo_ingreso": motivoIngreso,
        "cabina": cabina,
        "defensa_delantera": defensaDelantera,
        "tanque_Aire": tanqueAire,
        "motor": motor,
        "eje_impulsor": ejeImpulsor,
        "piso_cabiba": pisoCabiba,
        "quinta_rueda": quintaRueda,
        "tanque_Diesel": tanqueDiesel,
        "escape": escape,
        "CM_T_Izq": cmTIzq,
        "CM_T_Der": cmTDer,
        "Cap_Tanque_LT_Izq": capTanqueLtIzq,
        "Cap_Tanque_LT_Der": capTanqueLtDer,
        "Trampa_Izq": trampaIzq,
        "Trampa_Der": trampaDer,
        "Aluminio": aluminio,
        "Fierro": fierro,
        "Tapon_Diesel_Der": taponDieselDer,
        "Tapon_Diesel_Izq": taponDieselIzq,
        "fcha_rev": fchaRev.toJson(),
        "estatus": estatus,
        "placas": placas,
        "cp": cp,
        "usuario": usuario,
      };
}

class FchaRev {
  FchaRev({
    this.date,
    this.timezoneType,
    this.timezone,
  });

  DateTime date;
  int timezoneType;
  String timezone;

  factory FchaRev.fromJson(Map<String, dynamic> json) => FchaRev(
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
