import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_shop/model/category_model.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

class ReuqestDao {
  final String path;
  var formData = {'lon': '115.02932', 'lat': '35.76189'};

  ReuqestDao({this.path, this.formData});

  Future fetch() async {
    try {
      print('开始获取数据.......');
      Response response;
      Dio dio = Dio();
      dio.options.contentType =
          ContentType.parse('application/x-www-form-urlencoded');
      response = await dio.post(servicePath[path], data: formData);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('后端接口出现异常。');
      }
    } catch (e) {
      return print('Error: ===============$e');
    }
  }
}

Future getHomePageContent() async {
  try {
    print('开始获取数据.......');
    Response response;
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    Dio dio = Dio();
    dio.options.contentType =
        ContentType.parse('application/x-www-form-urlencoded');
    response = await dio.post(servicePath['homePageContent'], data: formData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常。');
    }
  } catch (e) {
    return print('Error: ===============$e');
  }
}
