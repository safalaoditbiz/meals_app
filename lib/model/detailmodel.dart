import 'dart:convert';

Detailmodel detailmodelFromJson(String str) =>
    Detailmodel.fromJson(json.decode(str));

String detailmodelToJson(Detailmodel data) => json.encode(data.toJson());

class Detailmodel {
  final List<Map<String, String?>>? meals;

  Detailmodel({
    this.meals,
  });

  factory Detailmodel.fromJson(Map<String, dynamic> json) => Detailmodel(
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
