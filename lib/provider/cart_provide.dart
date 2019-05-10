import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvide with ChangeNotifier {
  String cartString = "[]";

  sava(goodsId, goodsName, count, price, images) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    cartString = sharedPreferences.getString('cart_string');

    var temp = cartString == null ? [] : json.decode(cartString.toString());

    List<Map> tempList = (temp as List).cast();
    bool isHasData = false;

    for (int i = 0; i < tempList.length; i++) {
      var item = tempList[i];
      if (item['goodsId'] == goodsId) {
        item['count'] = item['count'] + 1;
        isHasData = true;
        break;
      }
    }

    if () {

    }
  }
}
