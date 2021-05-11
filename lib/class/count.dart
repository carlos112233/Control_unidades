import 'dart:convert';

Count countFromJson(String str) => Count.fromJson(json.decode(str));

String countToJson(Count data) => json.encode(data.toJson());

class Count {
  Count({
    this.the0,
    this.reg,
  });

  int the0;
  int reg;

  factory Count.fromJson(Map<String, dynamic> json) => Count(
        the0: json["0"],
        reg: json["reg"],
      );

  Map<String, dynamic> toJson() => {
        "0": the0,
        "reg": reg,
      };
}
