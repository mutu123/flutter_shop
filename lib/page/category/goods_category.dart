import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/page/category/goods_model.dart';
import 'package:flutter_shop/provider/child_category_provide.dart';
import 'package:flutter_shop/router/application.dart';
import 'package:flutter_shop/router/routes.dart';
import 'package:provide/provide.dart';
import 'package:flutter_shop/provider/category_goods_provide.dart';

class GoodsCategoryNav extends StatefulWidget {
  @override
  _GoodsCategoryNavState createState() => _GoodsCategoryNavState();
}

class _GoodsCategoryNavState extends State<GoodsCategoryNav> {
  GlobalKey<RefreshFooterState> _footerKey = GlobalKey();
  var scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<GoodsCategoryProvide>(builder: (context, child, goods) {
      try {
        if (Provide.value<ChildCategoryProvide>(context).page == 1) {
          scrollController.jumpTo(0.0);
        }
      } catch (e) {
        print('进入页面第一次初始化：${e}');
      }
      if (goods.goodsList.length > 0) {
        return Expanded(
            child: Container(
          width: ScreenUtil().setWidth(570),
          child: EasyRefresh(
            child: ListView.builder(
                controller: scrollController,
                itemCount: goods?.goodsList?.length ?? 0,
                itemBuilder: (context, index) => items(context, goods, index)),
            refreshFooter: ClassicsFooter(
                key: _footerKey,
                bgColor: Colors.white,
                textColor: Colors.pink,
                moreInfoColor: Colors.pink,
                showMore: true,
                noMoreText: goods.moreText,
                moreInfo: '加载中',
                loadReadyText: '上拉加载'),
            loadMore: () async {
              Provide.value<ChildCategoryProvide>(context).addPage();
              getGoodList(context: context);
            },
          ),
        ));
      } else {
        return Text('暂时没有数据');
      }
    });
  }

  Widget items(BuildContext context, GoodsCategoryProvide goods, int index) {
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
      onTap: () {
        Application.router.navigateTo(context,
            '${Routes.detailsPage}?id=${goods.goodsList[index].goodsId}');
      },
    );
  }
}

Widget _priceItem(GoodsCategoryProvide goods, int index) {
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
