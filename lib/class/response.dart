import 'dart:convert';

ReqResponse reqResponseFromJson(String str) =>
    ReqResponse.fromJson(json.decode(str));

String reqResponseToJson(ReqResponse data) => json.encode(data.toJson());

class ReqResponse {
  ReqResponse({
    this.user,
    this.accessToken,
  });

  User user;
  String accessToken;

  factory ReqResponse.fromJson(Map<String, dynamic> json) => ReqResponse(
        user: User.fromJson(json["user"]),
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "access_token": accessToken,
      };
}

class User {
  User({
    this.id,
    this.name,
    this.user,
    this.email,
    this.rol,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String user;
  String email;
  String rol;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        user: json["user"],
        email: json["email"],
        rol: json["rol"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      ); //respuesta del ws

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user": user,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
