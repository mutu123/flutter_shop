import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/provider/child_category_provide.dart';
import 'package:flutter_shop/provider/category_goods_provide.dart';
import 'package:flutter_shop/provider/details_info.dart';
import 'package:flutter_shop/router/application.dart';
import 'package:flutter_shop/router/routes.dart';
import 'page/index_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'provider/count_dart.dart';
import 'package:provide/provide.dart';
import 'package:flutter_shop/provider/theme_provider.dart';

void main() {
  var counter = Counter();
  var childCategory = ChildCategoryProvide();
  var goodsCategory = GoodsCategoryProvide();
  var detailInfo = DetailsInfoProvide();
  var theme = ThemeProvide();
  var providers = Providers();
  providers
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<ChildCategoryProvide>.value(childCategory))
    ..provide(Provider<GoodsCategoryProvide>.value(goodsCategory))
    ..provide(Provider<DetailsInfoProvide>.value(detailInfo))
    ..provide(Provider<ThemeProvide>.value(theme));
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///fluro start
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    ///fluro end

    return Container(
        child: Provide<ThemeProvide>(builder: (context, child, scope) {
      return MaterialApp(
        theme: scope.themeData,
        debugShowCheckedModeBanner: false,

        ///fluro start
        onGenerateRoute: Application.router.generator,

        ///fluro end
        home: IndexPage(),
      );
    }));
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    print('设备宽度:${ScreenUtil.screenWidth}'); //Device width
    print('设备高度:${ScreenUtil.screenHeight}'); //Device height
    print('设备的像素密度:${ScreenUtil.pixelRatio}'); //Device pixel density
    print(
        '底部安全区距离:${ScreenUtil.bottomBarHeight}'); //Bottom safe zone distance，suitable for buttons with full screen
    print(
        '状态栏高度:${ScreenUtil.statusBarHeight}px'); //Status bar height , Notch will be higher Unit px

    print('实际宽度的dp与设计稿px的比例:${ScreenUtil().scaleWidth}');
    print('实际高度的dp与设计稿px的比例:${ScreenUtil().scaleHeight}');

    print(
        '宽度和字体相对于设计稿放大的比例:${ScreenUtil().scaleWidth * ScreenUtil.pixelRatio}');
    print('高度相对于设计稿放大的比例:${ScreenUtil().scaleHeight * ScreenUtil.pixelRatio}');
    print('系统的字体缩放比例:${ScreenUtil.textScaleFactory}');

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("测试..."),
      ),
      body: new Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(375),
                  height: ScreenUtil().setHeight(200),
                  color: Colors.red,
                  child: Text(
                    '我的宽度:${ScreenUtil().setWidth(375)}dp',
                    style: TextStyle(
                      color: Colors.white,
//                    fontSize: ScreenUtil().setSp(12, false),
                    ),
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(375),
                  height: ScreenUtil().setHeight(200),
                  color: Colors.blue,
                  child: Text('我的宽度:${ScreenUtil().setWidth(375)}dp',
                      style: TextStyle(
                        color: Colors.white,
//                      fontSize: ScreenUtil().setSp(12, false),
                      )),
                ),
              ],
            ),
            Text('设备宽度:${ScreenUtil.screenWidth}px'),
            Text('设备高度:${ScreenUtil.screenHeight}px'),
            Text('设备的像素密度:${ScreenUtil.pixelRatio}'),
            Text('底部安全区距离:${ScreenUtil.bottomBarHeight}px'),
            Text('状态栏高度:${ScreenUtil.statusBarHeight}px'),
            Text(
              '实际高度的dp与设计稿px的比例:${ScreenUtil().scaleHeight}',
              textAlign: TextAlign.center,
            ),
            Text(
              '实际高度的dp与设计稿px的比例:${ScreenUtil().scaleHeight}',
              textAlign: TextAlign.center,
            ),
            Text(
              '宽度和字体相对于设计稿放大的比例:${ScreenUtil().scaleWidth * ScreenUtil.pixelRatio}',
              textAlign: TextAlign.center,
            ),
            Text(
              '高度相对于设计稿放大的比例:${ScreenUtil().scaleHeight * ScreenUtil.pixelRatio}',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(100),
            ),
            Text('系统的字体缩放比例:${ScreenUtil.textScaleFactory}'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('我的文字大小在设计稿上是14px，不会随着系统的文字缩放比例变化',
                    style: TextStyle(
                        color: Colors.black, fontSize: ScreenUtil().setSp(14))),
                Text('我的文字大小在设计稿上是14px，会随着系统的文字缩放比例变化',
                    style: TextStyle(
                        color: Colors.black, fontSize: ScreenUtil().setSp(14))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
