// To parse this JSON data, do
//
//     final categorymodel = categorymodelFromJson(jsonString);

import 'dart:convert';

Namecatmodel categorymodelFromJson(String str) =>
    Namecatmodel.fromJson(json.decode(str));

String categorymodelToJson(Namecatmodel data) => json.encode(data.toJson());

class Namecatmodel {
  final List<Map<String, String?>>? meals;

  Namecatmodel({
    this.meals,
  });

  factory Namecatmodel.fromJson(Map<String, dynamic> json) => Namecatmodel(
        meals: json["meals"] == null
            ? []
            : List<Map<String, String?>>.from(json["meals"]!.map((x) =>
                Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
      );

  Map<String, dynamic> toJson() => {
        "meals": meals == null
            ? []
            : List<dynamic>.from(meals!.map((x) =>
                Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
      };
}
