import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/model/category_goods.dart';
import 'package:flutter_shop/provider/category_goods.dart';
import 'package:flutter_shop/provider/child_category.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:provide/provide.dart';

getGoodList({String categorySubId, @required BuildContext context}) async {
  var data = {
    'categoryId': Provide.value<ChildCategory>(context).categryId, //大类id
    'categorySubId': categorySubId ?? '', //子类id
    'page': "1"
  };
  await ReuqestDao(path: 'getMallGoods', formData: data).fetch().then((val) {
    var data = json.decode(val.toString());
    CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
    Provide.value<GoodsCategory>(context).getGoodsList(goodsList.data);
    print('>>>>>>>>>>>>>>>>>>>:get good list length: ${goodsList?.data?.length ?? 0}');
  });
}
