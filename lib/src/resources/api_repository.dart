import 'package:dio/dio.dart';
import 'package:toonder_comic/src/dto/filter_post_by_category.dart';
import 'package:toonder_comic/src/models/banner.dart';
import 'package:toonder_comic/src/models/book.dart';
import 'package:toonder_comic/src/models/category.dart';
import 'package:toonder_comic/src/models/discover_model.dart';
import 'package:toonder_comic/src/resources/api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();
  Future<BannerModel> fetchBanner() async {
    final Response result = await _provider.get('getbanner');
    if (result == null) {
      throw Exception("Error");
    } else {
      return BannerModel.fromJson(result.data);
    }
  }

  Future<BookModel> fetchBook() async {
    final Response result = await _provider.get('mainhome?account_id=50231');
    if (result == null) {
      throw Exception("Error");
    } else {
      return BookModel.fromJson(result.data);
    }
  }

  Future<CategoryModel> fetchCategory() async {
    final Response result = await _provider.get('getlistcategory');
    if (result == null) {
      throw Exception("Error");
    } else {
      return CategoryModel.fromJson(result.data);
    }
  }

  Future<DiscoverModel> getPostByCategory(
      int category_id, int order_type) async {
    Map<String, dynamic> args = {};
    args["category_id"] = category_id;
    args["order_type"] = order_type;
    final Response result = await _provider.post("getbookbycategory", args);
    if (result.statusCode != 200) {
      throw Exception("Error");
    } else {
      return DiscoverModel.fromJson(result.data);
    }
  }

  Future<DiscoverModel> getRankPost(int type_rank, int order_type) async {
    Map<String, dynamic> args = {};
    args["type_rank"] = type_rank;
    args["order_type"] = order_type;
    final Response result = await _provider.post("ranking", args);
    if (result.statusCode != 200) {
      throw Exception("Error");
    } else {
      return DiscoverModel.fromJson(result.data);
    }
  }

  Future<DiscoverModel> releaseSchedule(int week_day, int order_type) async {
    Map<String, dynamic> args = {};
    args["week_day"] = week_day;
    args["order_type"] = order_type;
    final Response result = await _provider.post("getpublishdate", args);
    if (result.statusCode != 200) {
      throw Exception("Error");
    } else {
      return DiscoverModel.fromJson(result.data);
    }
  }
}

class NetworkError extends Error {}
