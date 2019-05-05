import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provider/details_info.dart';
import 'package:provide/provide.dart';

class DetailsWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    var goodsDetail = Provide.value<DetailsInfoProvide>(context)
//        .goodsInfo
//        .data
//        .goodInfo
//        .goodsDetail;
//    print('goodsDetail: $goodsDetail');
    return Provide<DetailsInfoProvide>(
      builder: (context, child, scope) {
        if (scope?.goodsInfo?.data?.goodInfo?.goodsDetail != null) {
          if (scope.isLeft) {
            return Container(
              child: Html(data: scope.goodsInfo.data.goodInfo.goodsDetail),
            );
          } else {
            return Container(
                width: ScreenUtil().setWidth(750),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text('暂时没有数据'));
          }
        } else {
          return Container(
              width: ScreenUtil().setWidth(750),
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text('正在加载中...'));
        }
      },
    );
  }
}
