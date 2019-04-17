import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/widget/floor_content.dart';
import 'package:flutter_shop/widget/leader_phone.dart';
import 'package:flutter_shop/widget/recommend.dart';
import 'package:flutter_shop/widget/top_navigator.dart';
import '../service/service_method.dart';
import 'dart:convert';
import '../widget/swiper_diy.dart';
import '../widget/ad_banner.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter/animation.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  GlobalKey<EasyRefreshState> _refreshKey = GlobalKey();
  GlobalKey<RefreshHeaderState> _headerKey = GlobalKey();
  GlobalKey<RefreshFooterState> _footerKey =  GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //futureBuilder 用于异步加载刷新界面，可代替setState
        child: FutureBuilder(
            future: getHomePageContent(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = json.decode(snapshot.data.toString());
                List<Map> swiperList = (data['data']['slides'] as List)
                    .cast(); // 顶部轮播组件数
                List<Map> navigatorList = (data['data']['category'] as List)
                    .cast(); // 顶部轮播组件数
                if (navigatorList.length > 10) {
                  navigatorList.removeRange(10, navigatorList.length);
                }
                String advertesPicture = data['data']['advertesPicture']['PICTURE_ADDRESS']; //广告图片
                String leaderImage = data['data']['shopInfo']['leaderImage']; //店长图片
                String leaderPhone = data['data']['shopInfo']['leaderPhone']; //店长电话
                List<Map> recommedList = (data['data']['recommend'] as List)
                    .cast();
                String floor1Title = data['data']['floor1Pic']['PICTURE_ADDRESS']; //楼层1的标题图片
                String floor2Title = data['data']['floor2Pic']['PICTURE_ADDRESS']; //楼层1的标题图片
                String floor3Title = data['data']['floor3Pic']['PICTURE_ADDRESS']; //楼层1的标题图片
                List<Map> floor1 = (data['data']['floor1'] as List)
                    .cast(); //楼层1商品和图片
                List<Map> floor2 = (data['data']['floor2'] as List)
                    .cast(); //楼层1商品和图片
                List<Map> floor3 = (data['data']['floor3'] as List)
                    .cast(); //楼层1商品和图片
                return EasyRefresh(
                  child: ListView(
                    children: <Widget>[
                      SwiperDiy(swiperDataList: swiperList,), //页面顶部轮播组件
                      TopNavigator(navigatorList: navigatorList,), //导航单元素
                      AdBanner(advertesPicture), //广告banner
                      LeaderPhone(leaderImage, leaderPhone), //拨打店长电话
                      Recommend(recommendList: recommedList,), //商品推荐
                      FloorTitle(picture_address: floor1Title),
                      FloorContent(floorGoodsList: floor1),
                      FloorTitle(picture_address: floor2Title),
                      FloorContent(floorGoodsList: floor2),
                      FloorTitle(picture_address: floor3Title),
                      FloorContent(floorGoodsList: floor3),
                    ],
                  ),
                  refreshHeader: ClassicsHeader(
                    key: _headerKey,
                    refreshText: "下拉刷新",
                    refreshReadyText: "释放刷新",
                    refreshingText: "加载中" + "...",
                    refreshedText: "刷新结束",
                    moreInfo: "updateAt",
                    bgColor: Colors.orange,
                    textColor: Colors.black,
                  ),
                  refreshFooter: ClassicsFooter(
                    key: _footerKey,
                    loadHeight: 40.0,
                    loadText: "上拉加载",
                    loadReadyText: "释放加载",
                    loadingText: "加载中",
                    loadedText: "加载结束",
                    noMoreText: "没有数据了",
                    moreInfo: "updateAt",
                    bgColor: Colors.orange,
                    textColor: Colors.black,
                  ),
                  loadMore: (){},
                  onRefresh: (){},
                );
              } else {
                return Text('加载中...');
              }
            }),
      ),
    );
  }
}

class FloorTitle extends StatelessWidget {
  final String picture_address; // 图片地址
  FloorTitle({Key key, this.picture_address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(picture_address),
    );
  }
}