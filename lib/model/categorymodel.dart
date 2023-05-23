// To parse this JSON data, do
//
//     final Categorymodel = detailmodelFromJson(jsonString);

import 'dart:convert';

Categorymodel CategorymodelFromJson(String str) =>
    Categorymodel.fromJson(json.decode(str));

String CategorymodelToJson(Categorymodel data) => json.encode(data.toJson());

class Categorymodel {
  final List<Category>? categories;

  Categorymodel({
    this.categories,
  });

  factory Categorymodel.fromJson(Map<String, dynamic> json) => Categorymodel(
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class Category {
  final String? idCategory;
  final String? strCategory;
  final String? strCategoryThumb;
  final String? strCategoryDescription;

  Category({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        idCategory: json["idCategory"],
        strCategory: json["strCategory"],
        strCategoryThumb: json["strCategoryThumb"],
        strCategoryDescription: json["strCategoryDescription"],
      );

  Map<String, dynamic> toJson() => {
        "idCategory": idCategory,
        "strCategory": strCategory,
        "strCategoryThumb": strCategoryThumb,
        "strCategoryDescription": strCategoryDescription,
      };
}
