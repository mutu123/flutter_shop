import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/category_goods.dart';
import 'package:flutter_shop/model/category_model.dart';
import 'package:flutter_shop/page/category/goods_model.dart';
import 'package:flutter_shop/provider/child_category.dart';
import 'package:provide/provide.dart';

class RightCategoryNav extends StatefulWidget {
  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  List<CategoryListData> categoryListData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(570),
      height: ScreenUtil().setHeight(80),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12, width: 1))),
      child: Provide<ChildCategory>(builder: (context, child, scope) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: scope?.bxMallSubDtoList?.length ?? 0,
            itemBuilder: (context, index) {
              return _rightInkWell(index, scope.bxMallSubDtoList[index]);
            });
      }),
    );
  }

  _rightInkWell(int index, BxMallSubDto bxmallsubDto) {
    var clickIndex =
        index == Provide.value<ChildCategory>(context).mOnClickIndex
            ? true
            : false;

    return InkWell(
      child: Container(
        margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        alignment: Alignment.center,
        child: Text(
          '${bxmallsubDto?.mallSubName ?? ''}',
          style: TextStyle(
              fontSize: ScreenUtil().setSp(28),
              color: clickIndex ? Colors.pinkAccent : Colors.black),
        ),
      ),
      onTap: () {
        Provide.value<ChildCategory>(context).changeIndex(index);
        getGoodList(context: context, categorySubId: bxmallsubDto?.mallSubId);
//        _getGoodList(bxmallsubDto?.mallCategoryId);
      },
    );
  }
}
