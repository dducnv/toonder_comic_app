import 'dart:convert';
import 'package:toonder_comic/src/models/book.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:toonder_comic/src/models/banner.dart';

import '../models/category.dart';

class NetworkRequest {
  static const String baseUrl = "https://api.toonder.vn/wecomi/api/book";

  //handle fetch data banner
  static List<BannerModal> parseBanner(String resBody) {
    var bannerJson = jsonDecode(resBody);
    var listBanner = bannerJson['info'] as List<dynamic>;
    List<BannerModal> banners =
        listBanner.map((model) => BannerModal.fromJson(model)).toList();
    return banners;
  }

  static Future<List<BannerModal>> fetchBanners() async {
    final response = await http.get(Uri.parse('${baseUrl}/getbanner'));
    if (response.statusCode == 200) {
      return compute(parseBanner, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('not found');
    } else {
      throw Exception('Can\'t get banner');
    }
  }

  //handle fetch data book
  static List<CategoryModel> parseCategory(String resBody) {
    var categoryJson = jsonDecode(resBody);
    var listCategory = categoryJson['info'] as List<dynamic>;
    List<CategoryModel> banners = listCategory.map((e) {
      return CategoryModel.fromJson(e);
    }).toList();

    return banners;
  }

  static Future<List<CategoryModel>> fetchCategories() async {
    final response =
        await http.get(Uri.parse('${baseUrl}/mainhome?account_id=50231'));
    if (response.statusCode == 200) {
      return compute(parseCategory, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('not found');
    } else {
      throw Exception('Can\'t get book');
    }
  }
}
