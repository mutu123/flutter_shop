import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/config/constant.dart';
import 'package:flutter_shop/model/detail_model.dart';
import 'package:flutter_shop/service/service_method.dart';

class DetailsInfoProvide with ChangeNotifier {
  DetailsModel goodsInfo;

  getGoodsDetail(String id) {
    var formData = {'goodId': id};

    ReuqestDao(path: Constant.getGoodDetailById, formData: formData)
        .fetch()
        .then((response) {
      var responseString = json.decode(response.toString());
      print("$responseString");
      goodsInfo = DetailsModel.fromJson(responseString);
      notifyListeners();
    }).catchError((onError) {
      print('details get data onError $onError');
    });
  }
}
