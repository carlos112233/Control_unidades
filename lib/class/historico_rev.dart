// To parse this JSON data, do
//
//     final historicoRev = historicoRevFromJson(jsonString);

import 'dart:convert';

HistoricoRev historicoRevFromJson(String str) =>
    HistoricoRev.fromJson(json.decode(str));

String historicoRevToJson(HistoricoRev data) => json.encode(data.toJson());

class HistoricoRev {
  HistoricoRev({
    this.the0,
    this.the1,
    this.the2,
    this.the3,
    this.the4,
    this.the5,
    this.the6,
    this.the7,
    this.the8,
    this.the9,
    this.the10,
    this.the11,
    this.the12,
    this.the13,
    this.the14,
    this.the15,
    this.the16,
    this.the17,
    this.the18,
    this.the19,
    this.the20,
    this.the21,
    this.the22,
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
  });

  int the0;
  String the1;
  String the2;
  String the3;
  String the4;
  String the5;
  String the6;
  String the7;
  String the8;
  String the9;
  String the10;
  String the11;
  String the12;
  String the13;
  String the14;
  String the15;
  String the16;
  String the17;
  String the18;
  String the19;
  String the20;
  String the21;
  The22 the22;
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
  The22 fchaRev;

  factory HistoricoRev.fromJson(Map<String, dynamic> json) => HistoricoRev(
        the0: json["0"],
        the1: json["1"],
        the2: json["2"],
        the3: json["3"],
        the4: json["4"],
        the5: json["5"],
        the6: json["6"],
        the7: json["7"],
        the8: json["8"],
        the9: json["9"],
        the10: json["10"],
        the11: json["11"],
        the12: json["12"],
        the13: json["13"],
        the14: json["14"],
        the15: json["15"],
        the16: json["16"],
        the17: json["17"],
        the18: json["18"],
        the19: json["19"],
        the20: json["20"],
        the21: json["21"],
        the22: The22.fromJson(json["22"]),
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
        fchaRev: The22.fromJson(json["fcha_rev"]),
      );

  Map<String, dynamic> toJson() => {
        "0": the0,
        "1": the1,
        "2": the2,
        "3": the3,
        "4": the4,
        "5": the5,
        "6": the6,
        "7": the7,
        "8": the8,
        "9": the9,
        "10": the10,
        "11": the11,
        "12": the12,
        "13": the13,
        "14": the14,
        "15": the15,
        "16": the16,
        "17": the17,
        "18": the18,
        "19": the19,
        "20": the20,
        "21": the21,
        "22": the22.toJson(),
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
      };
}

class The22 {
  The22({
    this.date,
    this.timezoneType,
    this.timezone,
  });

  DateTime date;
  int timezoneType;
  String timezone;

  factory The22.fromJson(Map<String, dynamic> json) => The22(
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
