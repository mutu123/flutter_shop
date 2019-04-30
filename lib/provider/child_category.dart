import 'package:flutter_shop/model/category_model.dart';
import 'package:provide/provide.dart';
import 'package:flutter/material.dart';

class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> bxMallSubDtoList;

  //右侧tab选中position
  int mOnClickIndex;

  //大类搜索goods的id
  String categryId = '4';

  getChildCategory(List<BxMallSubDto> list, String id) {
    categryId = id;
    mOnClickIndex = 0;
    BxMallSubDto all = BxMallSubDto();
    all.mallSubName = '全部';
    all.mallCategoryId = '0';
    all.mallSubId = '';
    all.comments = 'null';
    print('ChildCategory:>>>> ${list.length}');
    bxMallSubDtoList = [all];
    bxMallSubDtoList.addAll(list);
    print('ChildCategory:>>>> ${list.length}');

    notifyListeners();
  }

  changeIndex(int position) {
    mOnClickIndex = position;

    notifyListeners();
  }
}
