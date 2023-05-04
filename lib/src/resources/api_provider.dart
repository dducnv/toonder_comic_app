import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:toonder_comic/src/models/banner.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://api.toonder.vn/wecomi/api/book';
// banner api
  Future<dynamic> get(String path) async {
    try {
      Response response = await _dio.get('$_url/$path');

      return response;
    } catch (error) {
      throw Exception('Can\'t get api');
    }
  }

  Future<dynamic> post(String path, dynamic body) async {
    try {
      Response response = await _dio.post('$_url/$path', data: body);
      return response;
    } catch (error) {
      throw Exception('Can\'t post api');
    }
  }
}
