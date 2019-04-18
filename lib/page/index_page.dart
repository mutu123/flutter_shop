import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'catalogue_page.dart';
import 'home_page.dart';
import 'meber_page.dart';
import 'shop_cart_page.dart';

class IndexPage extends StatefulWidget {
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
    BottomNavigationBarItem(
        icon: Icon(Icons.storage), title: Text('catalogue')),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart), title: Text('cart')),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_circle), title: Text('member')),
  ];

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
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomTabs,
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
