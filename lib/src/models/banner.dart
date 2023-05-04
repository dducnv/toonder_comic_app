// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) =>
    BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  BannerModel({
    this.info,
    this.responsecode,
    this.description,
  });

  List<Info>? info;
  int? responsecode;
  String? description;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
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
    this.imgUrl,
    this.bookUuid,
    this.bookId,
    this.bannerType,
    this.eventId,
  });

  String? imgUrl;
  String? bookUuid;
  int? bookId;
  int? bannerType;
  int? eventId;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        imgUrl: json["imgUrl"],
        bookUuid: json["BookUUID"],
        bookId: json["BookID"],
        bannerType: json["BannerType"],
        eventId: json["EventID"],
      );

  Map<String, dynamic> toJson() => {
        "imgUrl": imgUrl,
        "BookUUID": bookUuid,
        "BookID": bookId,
        "BannerType": bannerType,
        "EventID": eventId,
      };
}
