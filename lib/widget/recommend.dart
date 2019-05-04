import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/router/application.dart';
import 'package:flutter_shop/router/routes.dart';

class Recommend extends StatelessWidget {

  final List recommendList;

  Recommend({Key key, this.recommendList}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(400),
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommendWidget(),
        ],
      ),
    );
  }

  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: Colors.black12)
          )
      ),
      child: Text('商品推荐', style: TextStyle(color: Colors.pink),),
    );
  }

  Widget _recommendWidget() {
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recommendList.length,
          itemBuilder: (context, index) {
            return _item(context,index);
          }),
    );
  }

  Widget _item(BuildContext context,int index) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context, '${Routes.detailsPage}?id=${recommendList[index]['goodsId']}');
      },
      child: Container(
        width: ScreenUtil().setWidth(250),
//        height: ScreenUtil().setHeight(330),
//        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border(
                left: BorderSide(width: 1, color: Colors.black12)
            )
        ),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]['image'], fit: BoxFit.cover,),
            Text('￥${recommendList[index]['mallPrice']}'),
            Text('￥${recommendList[index]['price']}', style: TextStyle(
                color: Colors.grey,
                decoration: TextDecoration.lineThrough),),
          ],
        ),
      ),
    );
  }
}


