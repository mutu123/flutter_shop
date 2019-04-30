import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:flutter_shop/provider/category_goods.dart';

class GoodsCategoryNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<GoodsCategory>(builder: (context, child, goods) {
      return Expanded(
          child: Container(
        width: ScreenUtil().setWidth(570),
        child: ListView.builder(
            itemCount: goods?.goodsList?.length,
            itemBuilder: (context, index) => items(context, goods, index)),
      ));
    });
  }

  Widget items(BuildContext context, GoodsCategory goods, int index) {
    if (goods.goodsList == null) return null;
    return InkWell(
      child: Container(
        height: ScreenUtil().setHeight(210),
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(width: 1.0, color: Colors.black12))),
        child: Row(
          children: <Widget>[
            Image.network(
              '${goods.goodsList[index].image}',
              width: ScreenUtil().setWidth(200),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5.0),
                  width: ScreenUtil().setWidth(370),
                  child: Text(
                    '${goods.goodsList[index].goodsName}',
                    style: TextStyle(fontSize: ScreenUtil().setSp(28)),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                _priceItem(goods, index)
              ],
            )
          ],
        ), //返回item 布局,
      ),
      onTap: () {},
    );
  }

  Widget _priceItem(GoodsCategory goods, int index) {
    return Container(
      padding: EdgeInsets.only(left: 5.0),
      width: ScreenUtil().setWidth(370),
      child: Row(
        children: <Widget>[
          Text('价格 ￥${goods.goodsList[index].oriPrice}',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(30), color: Colors.pinkAccent)),
          Text(
            '￥${goods.goodsList[index].presentPrice}',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(25),
                color: Colors.black26,
                decoration: TextDecoration.lineThrough),
          ),
        ],
      ),
    );
  }
}
