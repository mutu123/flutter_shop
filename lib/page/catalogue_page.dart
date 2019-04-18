import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/category_model.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:provide/provide.dart';
import 'package:flutter_shop/provider/child_category.dart';

class CataLoguePage extends StatefulWidget {
  _CataLogueState createState() => _CataLogueState();
}

class _CataLogueState extends State<CataLoguePage> {
  CategoryBigModel categoryBigModel;

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
            children: <Widget>[RightCategoryNav()],
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
          itemCount: categoryBigModel?.data?.length ?? 0,
          itemBuilder: (context, index) {
            return InkWell(
              child: Container(
                height: ScreenUtil().setHeight(100),
                alignment: Alignment.center,
                child: Text(
                  '${categoryBigModel.data[index].mallCategoryName}',
                  style: TextStyle(fontSize: ScreenUtil().setSp(28)),
                ),
              ),
              onTap: () {
                Provide.value<ChildCategory>(context).getChildCategory(
                    categoryBigModel?.data[index].bxMallSubDto);
              },
            );
          },
        ));
  }

  void iniData() async {
    await getCataloguePageContent().then((modle) {
      setState(() {
        categoryBigModel = modle;
      });
    }).catchError((onError) {
      print('===onError: $onError');
    });
  }
}

class RightCategoryNav extends StatefulWidget {
  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(80),
      width: ScreenUtil().setWidth(570),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12, width: 1))),
      child: Provide<ChildCategory>(builder: (context, child, scope) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: scope?.bxMallSubDto?.length ?? 0,
            itemBuilder: (context, index) {
              return InkWell(
                child: Container(
                  width: ScreenUtil().setWidth(120),
                  alignment: Alignment.center,
                  child: Text(
                    '${scope.bxMallSubDto[index].mallSubName}',
                    style: TextStyle(fontSize: ScreenUtil().setSp(28)),
                  ),
                ),
                onTap: () {},
              );
            });
      }),
    );
  }
}
