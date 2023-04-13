import 'dart:convert';

class BookModel {
  int? numberOfChapter;
  String? authorName;
  String? bookName;
  int? rating;
  int? authorAccountId;
  int? bookSexId;
  String? bookThumb;
  String? imgUrl;
  String? bookUUID;
  int? likeNo;
  String? categoryList;
  int? bookId;
  int? updateStatus;
  int? viewNo;
  String? lastUpdateTime;

  BookModel(
      {this.numberOfChapter,
      this.authorName,
      this.bookName,
      this.rating,
      this.authorAccountId,
      this.bookSexId,
      this.bookThumb,
      this.imgUrl,
      this.bookUUID,
      this.likeNo,
      this.categoryList,
      this.bookId,
      this.updateStatus,
      this.viewNo,
      this.lastUpdateTime});

  BookModel.stringToModel(String book){
     var bookJson = jsonDecode(book);
     BookModel bookModel = BookModel.fromJson(bookJson);
  }    
  BookModel.fromJson(Map<String, dynamic> json) {
    numberOfChapter = json['NumberOfChapter'];
    authorName = json['AuthorName'];
    bookName = json['BookName'];
    rating = json['Rating'];
    authorAccountId = json['authorAccountId'];
    bookSexId = json['BookSexId'];
    bookThumb = json['BookThumb'];
    imgUrl = json['imgUrl'];
    bookUUID = json['BookUUID'];
    if (json['LikeNo'] != null) {
      likeNo = json['LikeNo'];
    }
    if (json['TotalLikeNo'] != null) {
      likeNo = json['TotalLikeNo'];
    }
    if(json['CategoryList'] != null){
      categoryList = json['CategoryList'] ;
    }else{
       categoryList = json['CategoryName'] ;
    }
    
    bookId = json['BookId'];
    updateStatus = json['updateStatus'];
    viewNo: json['ViewNo']  != null ? json['ViewNo'] : 0;
    if (json['ViewNo']  != null) {
      viewNo = json['ViewNo'];
    }
    if (json['TotalLikeNo']  != null) {
      viewNo = json['TotalViewNo'];
    }
    lastUpdateTime = json['lastUpdateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NumberOfChapter'] = this.numberOfChapter;
    data['AuthorName'] = this.authorName;
    data['BookName'] = this.bookName;
    data['Rating'] = this.rating;
    data['authorAccountId'] = this.authorAccountId;
    data['BookSexId'] = this.bookSexId;
    data['BookThumb'] = this.bookThumb;
    data['imgUrl'] = this.imgUrl;
    data['BookUUID'] = this.bookUUID;
    if(data['LikeNo']) {
      data['LikeNo'] = this.likeNo;
    }
    if(data['TotalLikeNo']) {
      data['TotalLikeNo'] = this.likeNo;
    }
    data['CategoryList'] = this.categoryList;
    data['BookId'] = this.bookId;
    data['updateStatus'] = this.updateStatus;
    data['ViewNo'] = this.viewNo;
    if (data['ViewNo']) {
      data['ViewNo'] = this.viewNo;
    }
    if (data['TotalLikeNo']) {
      data['TotalLikeNo'] = this.viewNo;
    }
    data['lastUpdateTime'] = this.lastUpdateTime;
    return data;
  }
}
