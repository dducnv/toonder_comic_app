// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.info,
    this.responsecode,
    this.description,
  });

  List<Info>? info;
  int? responsecode;
  String? description;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        info: json["info"] == null
            ? []
            : List<Info>.from(json["info"]!.map((x) => Info.fromJson(x))),
        responsecode: json["responsecode"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "info": info == null
            ? []
            : List<dynamic>.from(info!.map((x) => x.toJson())),
        "responsecode": responsecode,
        "description": description,
      };
}

class Info {
  Info({
    this.categoryId,
    this.categoryName,
    this.iconLink,
    this.categoryDescription,
  });

  int? categoryId;
  String? categoryName;
  String? iconLink;
  String? categoryDescription;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        categoryId: json["CategoryId"],
        categoryName: json["CategoryName"],
        iconLink: json["IconLink"],
        categoryDescription: json["CategoryDescription"],
      );

  Map<String, dynamic> toJson() => {
        "CategoryId": categoryId,
        "CategoryName": categoryName,
        "IconLink": iconLink,
        "CategoryDescription": categoryDescription,
      };
}
