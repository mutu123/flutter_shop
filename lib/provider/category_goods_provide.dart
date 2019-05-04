import 'package:flutter/material.dart';
import 'package:flutter_shop/model/category_goods.dart';

class GoodsCategoryProvide with ChangeNotifier {
  List<CategoryListData> goodsList = [];

//加载更多时的提示
  String moreText = '正在加载';

  getGoodsList(List<CategoryListData> list) {
    goodsList = list;
    notifyListeners();
  }

  getMoreGoodsList(List<CategoryListData> list) {
    goodsList.addAll(list);
    notifyListeners();
  }

  setMoreText(String text) {
    moreText = text;
    notifyListeners();
  }
}
