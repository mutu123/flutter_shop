import 'package:flutter/material.dart';
import 'package:flutter_shop/model/category_goods.dart';

class GoodsCategory with ChangeNotifier {
  List<CategoryListData> goodsList = [];

  getGoodsList(List<CategoryListData> list) {
    goodsList = list;
    notifyListeners();
  }
}
