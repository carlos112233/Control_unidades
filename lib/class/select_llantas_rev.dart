// To parse this JSON data, do
//
//     final selectLlantasRev = selectLlantasRevFromJson(jsonString);

import 'dart:convert';

Map<String, SelectLlantasRev> selectLlantasRevFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) =>
        MapEntry<String, SelectLlantasRev>(k, SelectLlantasRev.fromJson(v)));

String selectLlantasRevToJson(Map<String, SelectLlantasRev> data) =>
    json.encode(
        Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class SelectLlantasRev {
  SelectLlantasRev({
    this.idLlantasTrac,
    this.tractoDollyRem,
    this.llantaNumEco,
    this.llantaPos,
    this.marcaDescrip,
    this.disenioDescripcion,
    this.observaciones,
    this.fchaRev,
    this.idRevTrac,
  });

  int idLlantasTrac;
  TractoDollyRem tractoDollyRem;
  String llantaNumEco;
  String llantaPos;
  MarcaDescrip marcaDescrip;
  DisenioDescripcion disenioDescripcion;
  Observaciones observaciones;
  FchaRev fchaRev;
  int idRevTrac;

  factory SelectLlantasRev.fromJson(Map<String, dynamic> json) =>
      SelectLlantasRev(
        idLlantasTrac: json["id_llantas_Trac"],
        tractoDollyRem: tractoDollyRemValues.map[json["Tracto_dolly_rem"]],
        llantaNumEco: json["llanta_num_eco"],
        llantaPos: json["llanta_pos"],
        marcaDescrip: marcaDescripValues.map[json["marca_descrip"]],
        disenioDescripcion:
            disenioDescripcionValues.map[json["disenio_descripcion"]],
        observaciones: observacionesValues.map[json["observaciones"]],
        fchaRev: FchaRev.fromJson(json["fcha_rev"]),
        idRevTrac: json["id_rev_trac"],
      );

  Map<String, dynamic> toJson() => {
        "id_llantas_Trac": idLlantasTrac,
        "Tracto_dolly_rem": tractoDollyRemValues.reverse[tractoDollyRem],
        "llanta_num_eco": llantaNumEco,
        "llanta_pos": llantaPos,
        "marca_descrip": marcaDescripValues.reverse[marcaDescrip],
        "disenio_descripcion":
            disenioDescripcionValues.reverse[disenioDescripcion],
        "observaciones": observacionesValues.reverse[observaciones],
        "fcha_rev": fchaRev.toJson(),
        "id_rev_trac": idRevTrac,
      };
}

enum DisenioDescripcion { DIRECCIONAL, TRACCION, MULTIPOSICION }

final disenioDescripcionValues = EnumValues({
  "DIRECCIONAL": DisenioDescripcion.DIRECCIONAL,
  "MULTIPOSICION": DisenioDescripcion.MULTIPOSICION,
  "TRACCION": DisenioDescripcion.TRACCION
});

class FchaRev {
  FchaRev({
    this.date,
    this.timezoneType,
    this.timezone,
  });

  DateTime date;
  int timezoneType;
  Timezone timezone;

  factory FchaRev.fromJson(Map<String, dynamic> json) => FchaRev(
        date: DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: timezoneValues.map[json["timezone"]],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "timezone_type": timezoneType,
        "timezone": timezoneValues.reverse[timezone],
      };
}

enum Timezone { AMERICA_MEXICO_CITY }

final timezoneValues =
    EnumValues({"America/Mexico_City": Timezone.AMERICA_MEXICO_CITY});

enum MarcaDescrip { FIRESTONE, MICHELIN, BRIDGESTONE, OPERBUS }

final marcaDescripValues = EnumValues({
  "BRIDGESTONE": MarcaDescrip.BRIDGESTONE,
  "FIRESTONE": MarcaDescrip.FIRESTONE,
  "MICHELIN": MarcaDescrip.MICHELIN,
  "OPERBUS": MarcaDescrip.OPERBUS
});

enum Observaciones { BIEN }

final observacionesValues = EnumValues({"bien": Observaciones.BIEN});

enum TractoDollyRem { ST271 }

final tractoDollyRemValues = EnumValues({"ST271": TractoDollyRem.ST271});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
