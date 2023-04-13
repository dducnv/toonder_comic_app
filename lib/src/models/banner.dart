class BannerModal {
  String? imgUrl;
  String? bookUUID;
  int? bookID;
  int? bannerType;
  int? eventID;

  BannerModal(
      {this.imgUrl, this.bookUUID, this.bookID, this.bannerType, this.eventID});

  BannerModal.fromJson(Map<String, dynamic> json) {
    imgUrl = json['imgUrl'];
    bookUUID = json['BookUUID'];
    bookID = json['BookID'];
    bannerType = json['BannerType'];
    eventID = json['EventID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imgUrl'] = this.imgUrl;
    data['BookUUID'] = this.bookUUID;
    data['BookID'] = this.bookID;
    data['BannerType'] = this.bannerType;
    data['EventID'] = this.eventID;
    return data;
  }
}