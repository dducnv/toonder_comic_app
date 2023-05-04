// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
  BookModel({
    this.info,
    this.description,
    this.responsecode,
  });

  List<Info>? info;
  String? description;
  int? responsecode;

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        info: json["info"] == null
            ? []
            : List<Info>.from(json["info"]!.map((x) => Info.fromJson(x))),
        description: json["description"],
        responsecode: json["responsecode"],
      );

  Map<String, dynamic> toJson() => {
        "info": info == null
            ? []
            : List<dynamic>.from(info!.map((x) => x.toJson())),
        "description": description,
        "responsecode": responsecode,
      };
}

class Info {
  Info({
    this.data,
    this.title,
    this.responsecode,
  });

  List<InfoDatum>? data;
  String? title;
  int? responsecode;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        data: json["data"] == null
            ? []
            : List<InfoDatum>.from(
                json["data"]!.map((x) => InfoDatum.fromJson(x))),
        title: json["title"],
        responsecode: json["responsecode"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "title": title,
        "responsecode": responsecode,
      };
}

class InfoDatum {
  InfoDatum({
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
    this.data,
    this.title,
    this.audltLimit,
    this.categoryId,
    this.bookTag,
    this.groupId,
    this.groupName,
    this.author,
    this.categoryName,
  });

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
  List<DatumDatum>? data;
  String? title;
  int? audltLimit;
  int? categoryId;
  String? bookTag;
  String? groupId;
  String? groupName;
  String? author;
  String? categoryName;

  factory InfoDatum.fromJson(Map<String, dynamic> json) => InfoDatum(
        numberOfChapter: json["NumberOfChapter"],
        authorName: json["AuthorName"],
        bookName: json["BookName"],
        rating: json["Rating"],
        authorAccountId: json["authorAccountId"],
        bookSexId: json["BookSexId"],
        bookThumb: json["BookThumb"],
        imgUrl: json["imgUrl"],
        bookUuid: json["BookUUID"],
        likeNo: json["LikeNo"],
        categoryList: json["CategoryList"],
        bookId: json["BookId"],
        updateStatus: json["updateStatus"],
        viewNo: json["ViewNo"],
        lastUpdateTime: json["lastUpdateTime"] == null
            ? null
            : DateTime.parse(json["lastUpdateTime"]),
        data: json["data"] == null
            ? []
            : List<DatumDatum>.from(
                json["data"]!.map((x) => DatumDatum.fromJson(x))),
        title: json["title"],
        audltLimit: json["audltLimit"],
        categoryId: json["CategoryID"],
        bookTag: json["BookTag"],
        groupId: json["groupId"],
        groupName: json["groupName"],
        author: json["Author"],
        categoryName: json["CategoryName"],
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
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "title": title,
        "audltLimit": audltLimit,
        "CategoryID": categoryId,
        "BookTag": bookTag,
        "groupId": groupId,
        "groupName": groupName,
        "Author": author,
        "CategoryName": categoryName,
      };
}

class DatumDatum {
  DatumDatum({
    this.totalNo,
    this.numberOfChapter,
    this.bookName,
    this.rating,
    this.bookThumb,
    this.imgUrl,
    this.bookUuid,
    this.categoryList,
    this.bookId,
    this.updateStatus,
    this.authorNick,
    this.viewNo,
    this.totalLikeNo,
    this.authorAccountId,
    this.likeNo,
  });

  int? totalNo;
  int? numberOfChapter;
  String? bookName;
  int? rating;
  String? bookThumb;
  String? imgUrl;
  String? bookUuid;
  String? categoryList;
  int? bookId;
  int? updateStatus;
  String? authorNick;
  int? viewNo;
  int? totalLikeNo;
  int? authorAccountId;
  int? likeNo;

  factory DatumDatum.fromJson(Map<String, dynamic> json) => DatumDatum(
        totalNo: json["TotalNo"],
        numberOfChapter: json["NumberOfChapter"],
        bookName: json["BookName"],
        rating: json["Rating"],
        bookThumb: json["BookThumb"],
        imgUrl: json["imgUrl"],
        bookUuid: json["BookUUID"],
        categoryList: json["CategoryList"],
        bookId: json["BookId"],
        updateStatus: json["updateStatus"],
        authorNick: json["AuthorNick"],
        viewNo: json["ViewNo"],
        totalLikeNo: json["TotalLikeNo"],
        authorAccountId: json["authorAccountId"],
        likeNo: json["LikeNo"],
      );

  Map<String, dynamic> toJson() => {
        "TotalNo": totalNo,
        "NumberOfChapter": numberOfChapter,
        "BookName": bookName,
        "Rating": rating,
        "BookThumb": bookThumb,
        "imgUrl": imgUrl,
        "BookUUID": bookUuid,
        "CategoryList": categoryList,
        "BookId": bookId,
        "updateStatus": updateStatus,
        "AuthorNick": authorNick,
        "ViewNo": viewNo,
        "TotalLikeNo": totalLikeNo,
        "authorAccountId": authorAccountId,
        "LikeNo": likeNo,
      };
}
