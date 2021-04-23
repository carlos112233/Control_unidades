import 'dart:convert';

CpError cpErrorFromJson(String str) => CpError.fromJson(json.decode(str));

String cpErrorToJson(CpError data) => json.encode(data.toJson());

class CpError {
  CpError({
    this.mensaje,
  });

  String mensaje;

  factory CpError.fromJson(Map<String, dynamic> json) => CpError(
        mensaje: json["mensaje"],
      );

  Map<String, dynamic> toJson() => {
        "mensaje": mensaje,
      };
}
