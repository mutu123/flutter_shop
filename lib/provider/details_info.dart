import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/config/constant.dart';
import 'package:flutter_shop/model/detail_model.dart';
import 'package:flutter_shop/service/service_method.dart';

class DetailsInfoProvide with ChangeNotifier {
  DetailsModel goodsInfo;

  //详情
  bool isLeft = true;

  //评论
  bool isRight = false;

  getGoodsDetail(String id) {
    var formData = {'goodId': id};
    goodsInfo = null;
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

  //改变tabBar的状态
  changeLeftAndRight(String changeState) {
    if (changeState == 'left') {
      isLeft = true;
      isRight = false;
    } else {
      isLeft = false;
      isRight = true;
    }
    notifyListeners();
  }
}
