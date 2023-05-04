// To parse this JSON data, do
//
//     final getPostByCategory = getPostByCategoryFromJson(jsonString);

import 'dart:convert';

DiscoverModel getPostByCategoryFromJson(String str) =>
    DiscoverModel.fromJson(json.decode(str));

String getPostByCategoryToJson(DiscoverModel data) =>
    json.encode(data.toJson());

class DiscoverModel {
  List<BookByCategory>? info;
  int? responsecode;
  String? description;

  DiscoverModel({
    this.info,
    this.responsecode,
    this.description,
  });

  factory DiscoverModel.fromJson(Map<String, dynamic> json) => DiscoverModel(
        info: json["info"] == null
            ? []
            : List<BookByCategory>.from(
                json["info"]!.map((x) => BookByCategory.fromJson(x))),
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

class BookByCategory {
  int? numberOfChapter;
  String? authorName;
  String? bookName;
  int? rating;
  int? authorAccountId;
  int? bookSexId;
  String? bookThumb;
  String? imgUrl;
  String? bookUuid;
  int? likeNo;
  String? categoryList;
  int? bookId;
  int? updateStatus;
  int? viewNo;
  DateTime? lastUpdateTime;

  BookByCategory({
    this.numberOfChapter,
    this.authorName,
    this.bookName,
    this.rating,
    this.authorAccountId,
    this.bookSexId,
    this.bookThumb,
    this.imgUrl,
    this.bookUuid,
    this.likeNo,
    this.categoryList,
    this.bookId,
    this.updateStatus,
    this.viewNo,
    this.lastUpdateTime,
  });

  factory BookByCategory.fromJson(Map<String, dynamic> json) => BookByCategory(
        numberOfChapter: json["NumberOfChapter"],
        authorName: json["AuthorName"] ?? json["AuthorNick"],
        bookName: json["BookName"],
        rating: json["Rating"],
        authorAccountId: json["authorAccountId"],
        bookSexId: json["BookSexId"],
        bookThumb: json["BookThumb"],
        imgUrl: json["imgUrl"],
        bookUuid: json["BookUUID"],
        likeNo: json["LikeNo"] ?? json["TotalLikeNo"],
        categoryList: json["CategoryList"],
        bookId: json["BookId"],
        updateStatus: json["updateStatus"],
        viewNo: json["ViewNo"],
        lastUpdateTime: json["lastUpdateTime"] == null
            ? null
            : DateTime.parse(json["lastUpdateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "NumberOfChapter": numberOfChapter,
        "AuthorName": authorName,
        "BookName": bookName,
        "Rating": rating,
        "authorAccountId": authorAccountId,
        "BookSexId": bookSexId,
        "BookThumb": bookThumb,
        "imgUrl": imgUrl,
        "BookUUID": bookUuid,
        "LikeNo": likeNo,
        "CategoryList": categoryList,
        "BookId": bookId,
        "updateStatus": updateStatus,
        "ViewNo": viewNo,
        "lastUpdateTime": lastUpdateTime?.toIso8601String(),
      };
}
