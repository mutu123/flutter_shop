import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/category_goods.dart';
import 'package:flutter_shop/model/category_model.dart';
import 'package:flutter_shop/page/category/goods_category.dart';
import 'package:flutter_shop/page/category/goods_model.dart';
import 'package:flutter_shop/page/category/right_categorynav.dart';
import 'package:flutter_shop/provider/category_goods_provide.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:provide/provide.dart';
import 'package:flutter_shop/provider/child_category_provide.dart';

class CataLoguePage extends StatefulWidget {
  _CataLogueState createState() => _CataLogueState();
}

class _CataLogueState extends State<CataLoguePage> {
  List<Data> categoryData;
  int _onclickIndex = 0; //记忆焦点

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    iniData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类'),
      ),
      body: Row(
        children: <Widget>[
          LeftCategoryNav(),
          Column(
            children: <Widget>[
              RightCategoryNav(),
              GoodsCategoryNav(),
            ],
          )
        ],
      ),
    );
  }

  LeftCategoryNav() {
    return Container(
        decoration: BoxDecoration(
            border: Border(right: BorderSide(color: Colors.black12, width: 1))),
        width: ScreenUtil().setWidth(180),
        child: ListView.builder(
          itemCount: categoryData?.length ?? 0,
          itemBuilder: (context, index) {
            return InkWell(
              child: Container(
                color: _onclickIndex == index
                    ? Colors.black12
                    : Colors.transparent,
                height: ScreenUtil().setHeight(100),
                alignment: Alignment.center,
                child: Text(
                  '${categoryData[index].mallCategoryName}',
                  style: TextStyle(fontSize: ScreenUtil().setSp(28)),
                ),
              ),
              onTap: () {
                setState(() {
                  _onclickIndex = index;
                });
                Provide.value<ChildCategoryProvide>(context).getChildCategory(
                    categoryData[index].bxMallSubDto,
                    categoryData[index].mallCategoryId);
                getGoodList(context: context);
              },
            );
          },
        ));
  }

  void iniData() async {
    await ReuqestDao(path: 'getCategory').fetch().then((response) {
      var modle = CategoryBigModel.fromJson(json.decode(response));
      setState(() {
        categoryData = modle?.data ?? [];
      });
      //初始化数据
      Provide.value<ChildCategoryProvide>(context).getChildCategory(
          categoryData[0]?.bxMallSubDto ?? [], categoryData[0]?.mallCategoryId);
      getGoodList(context: context);
    }).catchError((onError) {
      print('===onError: $onError');
    });
  }
}
