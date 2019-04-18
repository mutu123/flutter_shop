import 'package:flutter_shop/model/category_model.dart';
import 'package:provide/provide.dart';
import 'package:flutter/material.dart';

class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> bxMallSubDto;

  getChildCategory(List<BxMallSubDto> list) {
    bxMallSubDto = list;
    notifyListeners();
  }
}
