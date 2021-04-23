import 'dart:convert';

Tracto tractoFromJson(String str) => Tracto.fromJson(json.decode(str));

String tractoToJson(Tracto data) => json.encode(data.toJson());

class Tracto {
  Tracto({
    this.tractoNumEco,
    this.tractoPlacas,
    this.tractoAnio,
    this.tractoNumSerie,
    this.tractoNumMotor,
    this.tractoNumIave,
    this.seguroPoliza,
    this.tarjetaCirculacion,
    this.capacidadTanque,
    this.tractosct,
    this.folioInspfisicomec,
    this.marcaDescrip,
    this.modeloDescrip,
    this.statusFisico,
  });

  String tractoNumEco;
  String tractoPlacas;
  String tractoAnio;
  String tractoNumSerie;
  String tractoNumMotor;
  dynamic tractoNumIave;
  String seguroPoliza;
  String tarjetaCirculacion;
  String capacidadTanque;
  String tractosct;
  String folioInspfisicomec;
  String marcaDescrip;
  String modeloDescrip;
  String statusFisico;

  factory Tracto.fromJson(Map<String, dynamic> json) => Tracto(
        tractoNumEco: json["tracto_num_eco"],
        tractoPlacas: json["tracto_placas"],
        tractoAnio: json["tracto_anio"],
        tractoNumSerie: json["tracto_num_serie"],
        tractoNumMotor: json["tracto_num_motor"],
        tractoNumIave: json["tracto_num_iave"],
        seguroPoliza: json["seguro_poliza"],
        tarjetaCirculacion: json["tarjeta_circulacion"],
        capacidadTanque: json["capacidad_tanque"],
        tractosct: json["tractosct"],
        folioInspfisicomec: json["folioInspfisicomec"],
        marcaDescrip: json["marca_descrip"],
        modeloDescrip: json["modelo_descrip"],
        statusFisico: json["status_fisico"],
      );

  Map<String, dynamic> toJson() => {
        "tracto_num_eco": tractoNumEco,
        "tracto_placas": tractoPlacas,
        "tracto_anio": tractoAnio,
        "tracto_num_serie": tractoNumSerie,
        "tracto_num_motor": tractoNumMotor,
        "tracto_num_iave": tractoNumIave,
        "seguro_poliza": seguroPoliza,
        "tarjeta_circulacion": tarjetaCirculacion,
        "capacidad_tanque": capacidadTanque,
        "tractosct": tractosct,
        "folioInspfisicomec": folioInspfisicomec,
        "marca_descrip": marcaDescrip,
        "modelo_descrip": modeloDescrip,
        "status_fisico": statusFisico,
      };
}
