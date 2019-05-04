import 'package:flutter_shop/model/category_model.dart';
import 'package:provide/provide.dart';
import 'package:flutter/material.dart';

class ChildCategoryProvide with ChangeNotifier {
  List<BxMallSubDto> bxMallSubDtoList;

//右侧tab选中position
  int mOnClickIndex;

//大类搜索goods的id
  String categryId = '4';

//小类搜索goods的id
  String mallSubId = '';

//goods加载更多的page
  int page = 1;

  ///大类请求到的数据
  getChildCategory(List<BxMallSubDto> list, String id) {
    categryId = id;
    mOnClickIndex = 0;
    page = 1;
    mallSubId = '';
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

  changeIndex(int position, String id) {
    mOnClickIndex = position;
    mallSubId = id;
    page = 1;

    notifyListeners();
  }

  addPage() {
    page++;
  }
}
