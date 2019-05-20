import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/style/strings/strings.dart';
import 'catalogue_page.dart';
import 'home_page.dart';
import 'meber_page.dart';
import 'shop_cart_page.dart';

class IndexPage extends StatefulWidget {
  static final name = "/indexpage";

  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

 List<BottomNavigationBarItem> _bottomTabs(BuildContext context){
   return [
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text(Strings.of(context).home())),
      BottomNavigationBarItem(
          icon: Icon(Icons.storage), title: Text(Strings.of(context).catalogue())),
      BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart), title: Text(Strings.of(context).cart())),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_circle), title: Text(Strings.of(context).member())),
    ];
  }

  List<Widget> tabBodies = [
    HomePage(),
    CataLoguePage(),
    ShopCartPage(),
    MeberPage()
  ];

  int currentIndex = 0;
  var currentPage;
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPage = tabBodies[currentIndex];
    _pageController = PageController()
      ..addListener(() {
        if (currentPage != _pageController.page.round()) {
          setState(() {
            currentPage = _pageController.page.round();
          });
        }
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomTabs(context),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
//      body: pageList[_currentIndex],
      body: IndexedStack(
        index: currentIndex,
        children: tabBodies,
      ),
    );
  }
}
