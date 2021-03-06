import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_shop/page/details_page/details_bottom.dart';
import 'package:flutter_shop/page/details_page/details_explain.dart';
import 'package:flutter_shop/page/details_page/details_tabbar.dart';
import 'package:flutter_shop/page/details_page/details_top_area.dart';
import 'package:flutter_shop/page/details_page/detals_web.dart';
import 'package:flutter_shop/provider/details_info.dart';
import 'package:provide/provide.dart';

class DetailsPage extends StatelessWidget {
  final String goodsId;

  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商品详情页')),
      body: FutureBuilder(
          future: _getBackInfo(context),
          builder: (context, deilsInfo) {
            if (deilsInfo.hasData) {
              return Stack(
                children: <Widget>[
                  ListView(
                    children: <Widget>[
                      DetailsTopArea(),
                      DetailsExplain(),
                      DetailsTabBar(),
                      DetailsWeb(),
                    ],
                  ),
                  Positioned(
                    child: DetailsBottom(),
                    bottom: 0,
                    left: 0,
                  )
                ],
              );
            } else {
              return Text('正在加载中...');
            }
          }),
    );
  }

  Future _getBackInfo(BuildContext context) async {
    print('_getBackInfo goodsId = $goodsId');
    await Provide.value<DetailsInfoProvide>(context).getGoodsDetail(goodsId);
    return '完成加载';
  }
}
