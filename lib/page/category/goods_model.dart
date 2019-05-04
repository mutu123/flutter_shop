import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/model/category_goods.dart';
import 'package:flutter_shop/provider/category_goods_provide.dart';
import 'package:flutter_shop/provider/child_category_provide.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:provide/provide.dart';

getGoodList({@required BuildContext context}) async {
  var data = {
    'categoryId': Provide.value<ChildCategoryProvide>(context).categryId, //大类id
    'categorySubId':
        Provide.value<ChildCategoryProvide>(context).mallSubId, //子类id
    'page': Provide.value<ChildCategoryProvide>(context).page.toString()
  };
  await ReuqestDao(path: 'getMallGoods', formData: data).fetch().then((val) {
    var data = json.decode(val.toString());
    CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
    if (goodsList.data == null || goodsList?.data?.length == 0) {
      if(Provide.value<ChildCategoryProvide>(context).page == 1){
        Provide.value<GoodsCategoryProvide>(context).getGoodsList([]);
      }else{
        Provide.value<GoodsCategoryProvide>(context).setMoreText('没有更多了');
        Provide.value<GoodsCategoryProvide>(context)
            .getMoreGoodsList([]);
      }
    } else {
      if (Provide.value<ChildCategoryProvide>(context).page == 1) {
        Provide.value<GoodsCategoryProvide>(context)
            .getGoodsList(goodsList.data);
      } else {
        Provide.value<GoodsCategoryProvide>(context).setMoreText('正在加载数据');
        Provide.value<GoodsCategoryProvide>(context)
            .getMoreGoodsList(goodsList.data);
      }
    }
    print(
        '>>>>>>>>>>>>>>>>>>>:get good list length: ${goodsList?.data?.length ?? 0}');
  });
}
