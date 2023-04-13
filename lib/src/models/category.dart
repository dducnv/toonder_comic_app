import 'package:toonder_comic/src/models/book.dart';

class CategoryModel<T> {
  List<dynamic>? data;
  String? title;
  CategoryModel({this.data, this.title});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    title = json['title'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.data != null) {
  //     data['data'] = this.data!.map((v) => v?.toJson()).toList();
  //   }
  //   data['title'] = this.title;
  //   return data;
  // }
}
